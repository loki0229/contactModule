//
//  TMKWebserviceHandler.m
//  TMKToyota
//
//  Created by Rajasekhar Faniband on 11/19/15.
//  Copyright © 2015 Rubiya Faniband. All rights reserved.
//

#import "TMKWebserviceHandler.h"
#import <UIKit/UIKit.h>
#import "Uitility.h"

@implementation TMKWebserviceHandler
{
    Reachability *reachability;
    
}
// add selector for call back and receiver to indentify the className
-(void)getServiceUrl:(NSString*)url withReceiver:(id)receiver callback:(SEL)selector
{
    // checking for network
    
    if ([self netWorkRechability]) {
        
        [Uitility showActivitiIndicater:receiver];
        
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        //Set policies and other session configuration parameters if required
        [sessionConfig setRequestCachePolicy:NSURLRequestReloadIgnoringCacheData];
        
        sessionConfig.timeoutIntervalForRequest = 10.0;
        sessionConfig.timeoutIntervalForResource = 120.0;
        
       
        NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
        
    [[session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
            
            if (!error && response) {
                
                [Uitility removeActivitiIndicater:receiver];
                
                id responseData=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                [receiver performSelectorOnMainThread:selector withObject:responseData waitUntilDone:YES];
            }else{
                
                 [self showAlertView:@"Tayota" alertMessage:[NSString stringWithFormat:@"%@", [error localizedDescription]] withViewController:receiver];
                [Uitility removeActivitiIndicater:receiver];
            }
            
        }] resume];
        
        
    }else{
        
        
        [self showAlertView:@"Tayota" alertMessage:@"No internet connectivity detected please reconnect and try again" withViewController:receiver];
        
    }
}


-(void)showAlertView:(NSString *)alertTitle alertMessage:(NSString*)alertMessage withViewController:(id)viewController{


    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) { //You can use whatever method you want to check the system version.
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertTitle
                                                            message:alertMessage
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
        [alertView show];
    }
    else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle
                                                                                 message:alertMessage
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        //We add buttons to the alert controller by creating UIAlertActions:
        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil]; //You can use a block here to handle a press on this button
        [alertController addAction:actionOk];
        

        [viewController presentViewController:alertController animated:YES completion:nil];
        
    }


}
-(void)postServiceUrl:(NSString*)url withBody:(id)body withReceiver:(id)receiver callBack:(SEL)selector;
{
    
    if ([self netWorkRechability]) {
        NSError *error;
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"json" forHTTPHeaderField:@"Data-Type"];
        NSData *bodyData = [NSJSONSerialization dataWithJSONObject:body options:NSJSONWritingPrettyPrinted error:&error];
        // NSString *jsonString = [[NSString alloc] initWithData:bodyData encoding:NSUTF8StringEncoding];
        [request setHTTPBody:bodyData];
        
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        //Set policies and other session configuration parameters if required
        [sessionConfig setRequestCachePolicy:NSURLRequestReloadIgnoringCacheData];
        
        sessionConfig.timeoutIntervalForRequest = 60.0;
        sessionConfig.timeoutIntervalForResource = 120.0;
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
        
        
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (!error && response) {
                
                [Uitility removeActivitiIndicater:receiver];
                
                id responseData=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                [receiver performSelectorOnMainThread:selector withObject:responseData waitUntilDone:YES];
            }else{
                
                [self showAlertView:@"Tayota" alertMessage:[NSString stringWithFormat:@"%@", [error localizedDescription]] withViewController:receiver];
                [Uitility removeActivitiIndicater:receiver];
            }
            
        }];
        
        //All the session tasks will be in the suspended state. //Call resume method on the tasks to trigger the request
        [dataTask resume];
        
    }else{
        
        
        [self showAlertView:@"Tayota" alertMessage:@"No internet connectivity detected please reconnect and try again" withViewController:receiver];
        
        
    }
}
-(BOOL)netWorkRechability
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNetworkChange:) name:kReachabilityChangedNotification object:nil];
    
    reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    
    if(remoteHostStatus == NotReachable) {
        return NO;
    }
    else if (remoteHostStatus == ReachableViaWiFi )
    {
        NSLog(@"withoutNotification: wifi");
        return YES;
        
    }
    else if (remoteHostStatus == ReachableViaWWAN)
    {
        NSLog(@"cell");
        return YES;
        
    }
    
    return YES;
}
- (void) handleNetworkChange:(NSNotification *)notice
{
    
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    
    if(remoteHostStatus == NotReachable) {NSLog(@"no");

    
    }
    else if (remoteHostStatus == ReachableViaWiFi) {NSLog(@"wifi"); }
    else if (remoteHostStatus == ReachableViaWWAN) {NSLog(@"cell"); }
}

@end
