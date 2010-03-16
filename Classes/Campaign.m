//
//  Campaign.m
//  ObjectiveSponge
//
//  Created by ckhmini on 3/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Campaign.h"
#import "Response.h"
#import "Connection.h"

@implementation Campaign
@synthesize name, campaignId, createdAt, lastImpressionAt, firstImpressionAt, token, creatorId, metric;
+(Campaign *) findWithId:(NSString *) elementId andToken:(NSString *) token {
	NSString *path = [NSString stringWithFormat:@"%@?campaign_token=%@", [self getRemoteElementPath:elementId], token];
	Response *res = [Connection get:path withUser:[[self class] getRemoteUser] andPassword:[[self class]  getRemotePassword]];
	NSError **aError = nil;
	if([res isError] && aError) {
		*aError = res.error;
	}
	//NSLog(@"response: %@", res.body);
	return [self performSelector:[self getRemoteParseDataMethod] withObject:res.body];
}

+ (NSString *)getRemoteElementPath:(NSString *)elementId {
	return [NSString stringWithFormat:@"%@%@/%@/analytics%@", [self getRemoteSite], [self getRemoteCollectionName], elementId, [self getRemoteProtocolExtension]];
}

+ (NSMutableArray *) campaignsFromMap:(NSDictionary *) map {
	if( !map || map.count == 0) { return [NSMutableArray arrayWithObjects:nil]; }
	NSMutableArray *result = [NSMutableArray arrayWithCapacity:map.count];
	NSEnumerator *enumerator = [map keyEnumerator];
	NSString *key;
	while ((key = [enumerator nextObject])) {
		Campaign *campaign = [Campaign findWithId:key andToken:[map objectForKey:key]];
		if(campaign) {
			[result addObject:campaign];
		}
	}
	return result;
}
@end
