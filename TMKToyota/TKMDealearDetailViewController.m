//
//  TKMDealearDetailViewController.m
//  TMKToyota
//
//  Created by Rajasekhar Faniband on 11/20/15.
//  Copyright © 2015 Rubiya Faniband. All rights reserved.
//

#import "TKMDealearDetailViewController.h"
#import "DealersList.h"
#import "AppDelegate.h"
#import "Uitility.h"
#import "TKMDealerDetailCustomCell.h"
@interface TKMDealearDetailViewController ()
@property (weak, nonatomic) IBOutlet UITableView *dealerListTableView;
@end

@implementation TKMDealearDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.listOfDealers =[[NSArray alloc]init];
//listOfDealers
    //    AppDelegate* appDerlegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.listOfDealers = [DealersList fetchItemsInManagedObjectContext:[Uitility sharedAppDelegate].managedObjectContext ];
    
//    DealersList *deal=[[DealersList alloc] init];
//    
//    deal =(DealersList*)[self.listOfDealers objectAtIndex:0];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"DealersList" inManagedObjectContext:[Uitility sharedAppDelegate].managedObjectContext];
    
    DealersList *deal = [[DealersList alloc]initWithEntity:entity insertIntoManagedObjectContext:[Uitility sharedAppDelegate].managedObjectContext];
    
    deal =(DealersList*)[self.listOfDealers objectAtIndex:0];
    
    NSLog(@"deal %@",deal.address1);
    
    NSLog(@"listofDealers%lu",(unsigned long)[self.listOfDealers count]);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    // Do Stuff!
    if([item.title  isEqual: @"Sales"]) {
        NSLog(@"Sales");
        
        
        
        
    }else if([item.title  isEqual: @"Service"]) {
        NSLog(@"Service");
        
        
        
        
    }else if([item.title  isEqual: @"U Trust"]) {
        NSLog(@"U Trust");
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[self listOfDealers] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TKMDealerDetailCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    }

    
   // AppDelegate* appDerlegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"DealersList" inManagedObjectContext:[Uitility sharedAppDelegate].managedObjectContext];
    
    DealersList *deal = [[DealersList alloc]initWithEntity:entity insertIntoManagedObjectContext:[Uitility sharedAppDelegate].managedObjectContext];
    
    deal =(DealersList*)[self.listOfDealers objectAtIndex:indexPath.row];
    
    NSLog(@"deal %@",deal.address1);
    
    NSLog(@"listofDealers%lu",(unsigned long)[self.listOfDealers count]);
    // Configure the cell...
    cell.lblDealerDetailName.text = [NSString stringWithFormat:@"%@ , %@",deal.address1,deal.city];
    cell.lblDealerAddress.text = [NSString stringWithFormat:@"%@",deal.dealerName];
    [cell.mapButton setTag:indexPath.row];
    [cell.mapButton addTarget:self action:@selector(showDealerLocationInMap:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
-(void)showDealerLocationInMap:(id)sender
{
    
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row pressed!!");
}

@end
