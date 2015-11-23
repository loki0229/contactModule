//
//  Uitility.m
//  TMKToyota
//
//  Created by Rajasekhar Faniband on 11/20/15.
//  Copyright © 2015 Rubiya Faniband. All rights reserved.
//

#import "Uitility.h"
#import "AppDelegate.h"
#import "TKMActivitiIndicater.h"
@implementation Uitility

+ (AppDelegate*) sharedAppDelegate {
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

+(void)showActivitiIndicater:(id)receiver{
    
UIViewController * vtc=(UIViewController*)receiver;

TKMActivitiIndicater *tkm=[[TKMActivitiIndicater alloc] initWithFrame:vtc.view.bounds base:nil textColor:nil];


[vtc.view addSubview:tkm];
}
+(void)removeActivitiIndicater:(id)receiver{
    
    UIViewController * vtc=(UIViewController*)receiver;
    
    for (UIView *subView in vtc.view.subviews)
    {
        if ([subView isKindOfClass:[TKMActivitiIndicater class]])
        {
            [subView removeFromSuperview];
        }
    }
}

@end
