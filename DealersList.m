//
//  DealersList.m
//  TMKToyota
//
//  Created by Rajasekhar on 22/11/15.
//  Copyright © 2015 Rubiya Faniband. All rights reserved.
//

#import "DealersList.h"

@implementation DealersList

// Insert code here to add functionality to your managed object subclass
+ (void)insertDealerListsDataFromResponce:(NSArray *)arrDealerList inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
    
    for(NSDictionary *currentItem in arrDealerList) {
        
        [DealersList insertItemWithDictionary:currentItem inManagedObjectContext:managedObjectContext];
    }
}

+ (void)insertItemWithDictionary:(NSDictionary *)itemDictionary inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
    
    //prepare fetch request for item name
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    request.entity = [NSEntityDescription entityForName:@"DealersList" inManagedObjectContext:managedObjectContext];
    
    request.predicate = [NSPredicate predicateWithFormat:@"address1 = %@", [itemDictionary objectForKey:@"Address1"]];
    
    //execute fetch
    NSError *fetchError = nil;
    
    DealersList *dealersList = nil;
    
    dealersList = [[managedObjectContext executeFetchRequest:request error:&fetchError] lastObject];
    
    if(!fetchError) {
        
        //create if the item doesn't exist - if exists then properties are updated
        if(dealersList == nil) {
            
            dealersList = [NSEntityDescription insertNewObjectForEntityForName:@"DealersList" inManagedObjectContext:managedObjectContext];
        }
        
        
        //check wether key has object
        
        
        
        
        
        
        

        
        NSArray *allKeys=[itemDictionary allKeys];
      
        for (NSString* key in allKeys) {
            id obj = [itemDictionary objectForKey:key];
            if (obj != [NSNull null]) {
                
                if ([key isEqualToString:@"Address1"]) {
                    dealersList.address1 = (NSString*)[itemDictionary objectForKey:@"Address1"];
                }
                if ([key isEqualToString:@"Address2"]) {
                    dealersList.address2 = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"Address2"]];
                }
                if ([key isEqualToString:@"Address3"]) {
                    dealersList.address3 =[NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"Address3"]];
                }if ([key isEqualToString:@"Address4"]) {
                    dealersList.address4 = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"Address4"]];
                }if ([key isEqualToString:@"City"]) {
                    dealersList.city = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"City"]];
                }if ([key isEqualToString:@"CityCode"]) {
                    dealersList.cityCode =[NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"CityCode"]];
                }if ([key isEqualToString:@"DealerCode"]) {
                    dealersList.dealerCode = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"DealerCode"]];
                }if ([key isEqualToString:@"DealerEM60Service"]) {
                    dealersList.dealerEM60Service = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"DealerEM60Service"]];
                    //(NSString*) [itemDictionary objectForKey:@"DealerEM60Service"];
                }if ([key isEqualToString:@"DealerEmail"]) {
                    dealersList.dealerEmail = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"DealerEmail"]];
                }if ([key isEqualToString:@"DealerIsTFSINOutlet"]) {
                    dealersList.dealerIsTFSINOutlet = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"DealerIsTFSINOutlet"]];
                    
                    //(NSString*)[itemDictionary objectForKey:@"DealerIsTFSINOutlet"];
                }if ([key isEqualToString:@"DealerLocation"]) {
                    dealersList.dealerLocation = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"DealerLocation"]];
                }if ([key isEqualToString:@"DealerName"]) {
                    dealersList.dealerName = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"DealerName"]];
                }if ([key isEqualToString:@"DealerPrincipal"]) {
                    dealersList.dealerPrincipal =[NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"DealerPrincipal"]];
                }if ([key isEqualToString:@"DealerServiceEmail"]) {
                    dealersList.dealerServiceEmail = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"DealerServiceEmail"]];
                }if ([key isEqualToString:@"DealerUTrustAvailability"]) {
                    dealersList.dealerUTrustAvailability = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"DealerUTrustAvailability"]];
                }if ([key isEqualToString:@"DealerWorkingHours"]) {
                    dealersList.dealerWorkingHours = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"DealerWorkingHours"]];
                }if ([key isEqualToString:@"Facility"]) {
                    dealersList.facility = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"Facility"]];
                }if ([key isEqualToString:@"FacilityCode"]) {
                    dealersList.facilityCode =[NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"FacilityCode"]];
                }if ([key isEqualToString:@"Fax"]) {
                    dealersList.fax = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"Fax"]];
                }if ([key isEqualToString:@"GroupCode"]) {
                    dealersList.groupCode = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"GroupCode"]];
                }if ([key isEqualToString:@"IsActive"]) {
                    dealersList.isActive = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"IsActive"]];
                }if ([key isEqualToString:@"Latitude"]) {
                    dealersList.latitude = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"Latitude"]];
                }if ([key isEqualToString:@"Longitude"]) {
                    dealersList.longitude = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"Longitude"]];
                }if ([key isEqualToString:@"Phone"]) {
                    dealersList.phone = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"Phone"]];
                }if ([key isEqualToString:@"Pincode"]) {
                    dealersList.pincode = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"Pincode"]];
                    
                    //(NSString*) [itemDictionary objectForKey:@"Pincode"];
                }if ([key isEqualToString:@"ServiceCenter"]) {
                    dealersList.serviceCenter = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"ServiceCenter"]];
                }if ([key isEqualToString:@"ServiceEmergencyNumber"]) {
                    dealersList.serviceEmergencyNumber = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"ServiceEmergencyNumber"]];
                }if ([key isEqualToString:@"Url"]) {
                    dealersList.url = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"Url"]];
                }if ([key isEqualToString:@"Zone"]) {
                    dealersList.tzone = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"Zone"]];
                }if ([key isEqualToString:@"ZoneCode"]) {
                    dealersList.zoneCode = [NSString stringWithFormat:@"%@",[itemDictionary valueForKey:@"ZoneCode"]];
                }
                
                
                
                // do something
               // dealersList.address2 = [itemDictionary objectForKey:key];
            }

        }
        
        
        //save
        NSError *saveError = nil;
        
        [managedObjectContext save:&saveError];
    }
}

+ (NSArray *)fetchItemsInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
    
    NSArray *results = [[NSArray alloc] init];
    
    
    //prepare fetch request for items
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    request.entity = [NSEntityDescription entityForName:@"DealersList" inManagedObjectContext:managedObjectContext];
    
    
    //execute fetch request
    NSError *error = nil;
    
    NSArray *items = [managedObjectContext executeFetchRequest:request error:&error];
    
    if(items) {
        
        results = items;
    }
    
    return results;
}

@end
