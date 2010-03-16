//
//  PropertyListFile.h
//  ifacebook
//
//  Created by ckhmini on 11/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#define PROPERTY_LIST_FILENAME @"applicationProperties"
#define PROPERTY_CAMPAIGN_MAP @"PROPERTY_CAMPAIGN_MAP"
#define PROPERTY_FALSE [NSNumber numberWithBool:FALSE]
#define PROPERTY_TRUE [NSNumber numberWithBool:TRUE]

@interface PropertyListFile : NSObject {
	NSString *fileName;
	NSMutableDictionary *dictionary;
}

-(id) initWithFileName:(NSString *) fileName;
- (id)objectForKey:(id)aKey;
-(void) setObject:(id)anObject forKey:(id)aKey;
-(void) setValue:(id)anObject forKey:(id)aKey;
- (BOOL)writePlist;
- (void)readPlist;
- (BOOL)writeApplicationData:(NSData *)data toFile:(NSString *)fileName;
- (NSData *)applicationDataFromFile:(NSString *)fileName;
@end
