//
//  CampaignInputController.m
//  ObjectiveSponge
//
//  Created by ckhmini on 3/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CampaignInputController.h"
#import "ObjectiveSpongeAppDelegate.h"

@implementation CampaignInputController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Add Campaign";
}

- (void) submit:(id)sender {
	NSString *campaignId = idField.text;
	NSString *campaignToken = tokenField.text;
	Campaign *campaign = [Campaign findWithId:campaignId andToken:campaignToken];
	if( campaign ) {
		[[ObjectiveSpongeAppDelegate instance] addCampaign:campaign];
		[[ObjectiveSpongeAppDelegate instance].navigationController popToRootViewControllerAnimated:TRUE];
		UITableViewController *topView = (UITableViewController *) [ObjectiveSpongeAppDelegate instance].navigationController.topViewController;
		[[topView tableView] reloadData];
	} else {
		
	}

}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
