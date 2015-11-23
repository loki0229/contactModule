//
//  TKMActivitiIndicater.h
//  TMKToyota
//
//  Created by Rajasekhar on 22/11/15.
//  Copyright © 2015 Rubiya Faniband. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TKMActivitiIndicater : UIView


@property(nonatomic,strong)UIView *hudView;


@property(nonatomic,strong)UIActivityIndicatorView *activityIndicatorView;


@property(nonatomic,strong)UILabel *captionLabel;

-(instancetype) initWithFrame:(CGRect)frame base:(UIColor *)base textColor:(UIColor *)textColor;
@end
