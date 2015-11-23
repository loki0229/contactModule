//
//  Uitility.h
//  TMKToyota
//
//  Created by Rajasekhar Faniband on 11/20/15.
//  Copyright © 2015 Rubiya Faniband. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface Uitility : NSObject
//+(void)showProgressIndicator:(UIViewController*)vCtr;
//+(Uitility *)sharedInstance;
+ (AppDelegate*) sharedAppDelegate;
+(void)showActivitiIndicater:(id)receiver;
+(void)removeActivitiIndicater:(id)receiver;
@end
