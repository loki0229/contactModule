//
//  DealersList.h
//  TMKToyota
//
//  Created by Rajasekhar on 22/11/15.
//  Copyright © 2015 Rubiya Faniband. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface DealersList : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
+ (void)insertDealerListsDataFromResponce:(NSArray *)arrDealerList inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

+ (void)insertDealerWithDictionary:(NSDictionary *)itemDictionary inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

+ (NSArray *)fetchItemsInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END

#import "DealersList+CoreDataProperties.h"
