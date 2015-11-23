//
//  TKMActivitiIndicater.m
//  TMKToyota
//
//  Created by Rajasekhar on 22/11/15.
//  Copyright © 2015 Rubiya Faniband. All rights reserved.
//

#import "TKMActivitiIndicater.h"

@implementation TKMActivitiIndicater

-(instancetype) initWithFrame:(CGRect)frame base:(UIColor *)base textColor:(UIColor *)textColor
{
    if(self = [super initWithFrame:frame])
    {
//        self.backgroundColor = base;
//        self.lblLoding.textColor = textColor;
        
        _hudView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 170, 170)];
        _hudView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        _hudView.clipsToBounds = YES;
        _hudView.layer.cornerRadius = 10.0;
        
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _activityIndicatorView.frame = CGRectMake(65, 40, _activityIndicatorView.bounds.size.width, _activityIndicatorView.bounds.size.height);
        [_hudView addSubview:_activityIndicatorView];
        [_activityIndicatorView startAnimating];
        
        _captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 115, 130, 22)];
        _captionLabel.backgroundColor = [UIColor clearColor];
        _captionLabel.textColor = [UIColor whiteColor];
        _captionLabel.adjustsFontSizeToFitWidth = YES;
        _captionLabel.textAlignment = NSTextAlignmentCenter;
        _captionLabel.text = @"Loading...";
        [_hudView addSubview:_captionLabel];
        _hudView.center = CGPointMake(self.frame.size.width  / 2,
                                         self.frame.size.height / 2);
        
        [self setBackgroundColor:[UIColor lightGrayColor]];
        
        [self addSubview:self.hudView];

    }
    return self;
}

@end
