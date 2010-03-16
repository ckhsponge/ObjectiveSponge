//
//  ObjectiveSpongeAppDelegate.h
//  ObjectiveSponge
//
//  Created by ckhmini on 3/12/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "PropertyListFile.h"
#import "Campaign.h"

@interface ObjectiveSpongeAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	NSMutableArray *campaigns;
	PropertyListFile *propertyList;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) NSMutableArray *campaigns;

+(ObjectiveSpongeAppDelegate *) instance;
-(void) addCampaign:(Campaign *) campaign;
-(void) deleteCampaignAtIndex:(int) index;
@end

