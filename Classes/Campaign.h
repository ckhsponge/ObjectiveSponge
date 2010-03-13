//
//  Campaign.h
//  ObjectiveSponge
//
//  Created by ckhmini on 3/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectiveResource.h"
#import "ORObject.h"
#import "Metric.h"


@interface Campaign : ORObject {
	NSString *name;
	NSString *campaignId;
	NSString *creatorId;
	NSString *token;
	NSDate   *createdAt;
	NSDate   *firstImpressionAt;
	NSDate   *lastImpressionAt;
	Metric   *metric;
}

@property (nonatomic , retain) NSString *name;
@property (nonatomic , retain) NSString  *campaignId;
@property (nonatomic , retain) NSString  *creatorId;
@property (nonatomic , retain) NSString  *token;
@property (nonatomic , retain) NSDate * createdAt;
@property (nonatomic , retain) NSDate * firstImpressionAt;
@property (nonatomic , retain) NSDate * lastImpressionAt;
@property (nonatomic , retain) Metric *metric;

+(Campaign *) findWithId:(NSString *) campaignId andToken:(NSString *) token;
@end
