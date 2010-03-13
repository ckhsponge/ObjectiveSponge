//
//  CampaignViewController.h
//  ObjectiveSponge
//
//  Created by ckhmini on 3/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Campaign.h"

@interface CampaignViewController : UIViewController {
	IBOutlet UILabel *impressionsLabel;
	IBOutlet UILabel *interactionsLabel;
	IBOutlet UILabel *completedInteractionsLabel;
	IBOutlet UILabel *clickThroughsLabel;
	IBOutlet UILabel *mouseoversLabel;
	Campaign *campaign;
}
@property(nonatomic, retain) Campaign *campaign;

- (id) initWithCampaign:(Campaign *) _campaign;
@end
