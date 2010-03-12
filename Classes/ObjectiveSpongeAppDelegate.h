//
//  ObjectiveSpongeAppDelegate.h
//  ObjectiveSponge
//
//  Created by ckhmini on 3/12/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

@interface ObjectiveSpongeAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

