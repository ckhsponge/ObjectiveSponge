//
//  CampaignViewController.m
//  ObjectiveSponge
//
//  Created by ckhmini on 3/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CampaignViewController.h"


@implementation CampaignViewController
@synthesize campaign;
- (id) initWithCampaign:(Campaign *) _campaign {
	if (self = [super init]) {
        self.campaign = _campaign;
    }
    return self;
}
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
	impressionsLabel.text = [campaign.metric.impressions description];
	interactionsLabel.text = [campaign.metric.interactions description];
	completedInteractionsLabel.text = [campaign.metric.completedInteractions description];
	clickThroughsLabel.text = [campaign.metric.clickThroughs description];
	mouseoversLabel.text = [campaign.metric.mouseovers description];
	self.title = campaign.name;
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
