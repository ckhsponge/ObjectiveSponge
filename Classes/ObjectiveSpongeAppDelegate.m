//
//  ObjectiveSpongeAppDelegate.m
//  ObjectiveSponge
//
//  Created by ckhmini on 3/12/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ObjectiveSpongeAppDelegate.h"
#import "RootViewController.h"
#import "Campaign.h"


@implementation ObjectiveSpongeAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize campaigns;



+(ObjectiveSpongeAppDelegate *) instance {
	return (ObjectiveSpongeAppDelegate *) [[UIApplication sharedApplication] delegate];
}

#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	[ObjectiveResourceConfig setSite:@"http://spongecell.com/api/"];
	//Campaign *campaign = [Campaign findWithId:@"" andToken:@""];
	//NSLog(@"Campaign: %@",campaign.name);
	//self.campaigns = [[NSArray alloc] initWithObjects:campaign, nil];
	propertyList = [[PropertyListFile alloc] initWithFileName:PROPERTY_LIST_FILENAME];
	self.campaigns = [Campaign campaignsFromMap:[propertyList objectForKey:PROPERTY_CAMPAIGN_MAP]]; // [NSMutableArray arrayWithObjects:nil];
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}

-(void) writeProperties {
	NSMutableDictionary *campaignMap = [[NSMutableDictionary alloc] initWithCapacity:self.campaigns.count];
	for (Campaign *campaign in self.campaigns) {
		[campaignMap setObject:campaign.token forKey:campaign.campaignId];
	}
	[propertyList setObject:campaignMap forKey:PROPERTY_CAMPAIGN_MAP];
	[campaignMap release];
}

-(void) addCampaign:(Campaign *) campaign {
	[self.campaigns addObject:campaign];
	[self writeProperties];
}

-(void) deleteCampaignAtIndex:(int) index {
	[self.campaigns removeObjectAtIndex:index];
	[self writeProperties];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

