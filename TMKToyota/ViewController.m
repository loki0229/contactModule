//
//  ViewController.m
//  TMKToyota
//
//  Created by Rajasekhar Faniband on 11/19/15.
//  Copyright © 2015 Rubiya Faniband. All rights reserved.
//

#import "ViewController.h"
#import "TMKWebserviceHandler.h"
#import "DealersList.h"
#import "DealersList+CoreDataProperties.h"
#import "AppDelegate.h"
#import "Uitility.h"
#import "TKMDealearDetailViewController.h"

@interface ViewController ()

{
    TMKWebserviceHandler *WebserviceHandler;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    WebserviceHandler=[[TMKWebserviceHandler alloc]init];
    
   // [WebserviceHandler getServiceUrl:TKMContactToyota withReceiver:self callback:@selector(getContactDetails:)];
   
}
-(void)getContactDetails:(id)sender
{
    NSDictionary *dic=(NSDictionary*)sender;
    
    NSLog(@"dic :%@",dic);
}
- (void)delearDetail:(id)sender {
    
    
    
    NSDictionary *dic=(NSDictionary*)sender;
    
    NSLog(@"dic :%@",[dic objectForKey:@"Dealers"]);
    
    NSArray *dealersArr=[dic objectForKey:@"Dealers"];
    
    NSLog(@"arraycount:%lu",(unsigned long)[dealersArr count]);
    
      //[DealersList insertItemDataFromPlist:dealersArr inManagedObjectContext:self.managedObjectContext];
    //AppDelegate* appDerlegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    
    [DealersList insertDealerListsDataFromResponce:dealersArr inManagedObjectContext:[Uitility sharedAppDelegate].managedObjectContext];
    
    NSString * storyboardName = @"Main";
    NSString * viewControllerID = @"DealerListViewController";
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    TKMDealearDetailViewController * controller = (TKMDealearDetailViewController *)[storyboard instantiateViewControllerWithIdentifier:viewControllerID];
    [self.navigationController pushViewController:controller animated:YES];
    
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id)sender
{
    if ([segue.identifier isEqualToString:@"ContactToyota"])
    {
      

    }
    
}



- (IBAction)btnLocateDealers:(UIButton *)sender {
    [WebserviceHandler getServiceUrl:TKMDealearsDetails withReceiver:self callback:@selector(delearDetail:)];
   
    
}
@end
