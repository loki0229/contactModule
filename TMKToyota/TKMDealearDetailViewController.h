//
//  TKMDealearDetailViewController.h
//  TMKToyota
//
//  Created by Rajasekhar Faniband on 11/20/15.
//  Copyright © 2015 Rubiya Faniband. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TKMDealearDetailViewController : UIViewController <UITabBarDelegate ,UISearchResultsUpdating, UISearchBarDelegate>
@property (nonatomic, strong) NSArray *listOfDealers;

@property (nonatomic, strong) UISearchController *searchController;
@end
