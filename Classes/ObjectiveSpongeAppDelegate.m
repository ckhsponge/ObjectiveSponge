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
	self.campaigns = [NSArray arrayWithObjects:nil];
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
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

