//
//  CampaignInputController.h
//  ObjectiveSponge
//
//  Created by ckhmini on 3/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CampaignInputController : UIViewController {
	IBOutlet UITextField *idField;
	IBOutlet UITextField *tokenField;
}
- (IBAction) submit:(id) sender;
@end
