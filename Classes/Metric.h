//
//  Metric.h
//  ObjectiveSponge
//
//  Created by ckhmini on 3/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ORObject.h"

@interface Metric : ORObject {
	NSNumber *impressions;
	NSNumber *interactions;
	NSNumber *completedInteractions;
	NSNumber *clickThroughs;
	NSNumber *mouseovers;
}
@property(nonatomic, retain) NSNumber *impressions;
@property(nonatomic, retain) NSNumber *interactions;
@property(nonatomic, retain) NSNumber *completedInteractions;
@property(nonatomic, retain) NSNumber *clickThroughs;
@property(nonatomic, retain) NSNumber *mouseovers;
@end
