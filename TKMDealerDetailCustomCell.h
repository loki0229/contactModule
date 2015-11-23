//
//  TKMDealerDetailCustomCell.h
//  TMKToyota
//
//  Created by mac on 23/11/15.
//  Copyright © 2015 Rubiya Faniband. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TKMDealerDetailCustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblDealerDetailName;
@property (weak, nonatomic) IBOutlet UILabel *lblDealerAddress;
- (IBAction)mapButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *mapButton;
@end
