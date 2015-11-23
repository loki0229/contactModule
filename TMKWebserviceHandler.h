//
//  TMKWebserviceHandler.h
//  TMKToyota
//
//  Created by Rajasekhar Faniband on 11/19/15.
//  Copyright © 2015 Rubiya Faniband. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
@interface TMKWebserviceHandler : NSObject
-(void)getServiceUrl:(NSString*)url withReceiver:(id)receiver callback:(SEL)selector;
-(void)postServiceUrl:(NSString*)url withBody:(id)body withReceiver:(id)receiver callBack:(SEL)selector;
-(BOOL)netWorkRechability;
@end
