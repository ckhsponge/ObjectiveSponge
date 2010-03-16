//
//  PropertyListFile.m
//  ifacebook
//
//  Created by ckhmini on 11/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PropertyListFile.h"


@implementation PropertyListFile

-(id) initWithFileName:(NSString *) _fileName {
	if( self = [super init] ) {
		fileName = [_fileName copy];
		dictionary = [[NSMutableDictionary alloc] init];
		[self readPlist];
	}
	return self;
}

- (id)objectForKey:(id)aKey {
	return [dictionary objectForKey:aKey];
}

-(void) setObject:(id)anObject forKey:(id)aKey {
	[dictionary setObject:anObject forKey:aKey];
	[self writePlist];
}

-(void) setValue:(id)anObject forKey:(id)aKey {
	[dictionary setValue:anObject forKey:aKey];
	[self writePlist];
}

- (BOOL)writePlist {
    NSString *error;
    NSData *pData = [NSPropertyListSerialization dataFromPropertyList:dictionary  format:NSPropertyListBinaryFormat_v1_0 errorDescription:&error];
    if (!pData) {
        NSLog(@"%@", error);
        return NO;
    }
    return ([self writeApplicationData:pData toFile:fileName]);
}

- (void)readPlist {
    NSData *retData;
    NSString *error;
    NSPropertyListFormat format;
	
    retData = [self applicationDataFromFile:fileName];
    if (!retData) {
        NSLog(@"Data file not returned.");
        return;
    }
    NSMutableDictionary *newPlist = [NSPropertyListSerialization propertyListFromData:retData  mutabilityOption:NSPropertyListMutableContainers format:&format errorDescription:&error];
    if (!newPlist){
        NSLog(@"Plist not returned, error: %@", error);
		return;
    }
	[dictionary setDictionary:newPlist];
}

- (BOOL)writeApplicationData:(NSData *)data toFile:(NSString *)_fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    if (!documentsDirectory) {
        NSLog(@"Documents directory not found!");
        return NO;
    }
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:_fileName];
    return ([data writeToFile:appFile atomically:YES]);
}

- (NSData *)applicationDataFromFile:(NSString *)_fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:_fileName];
    NSData *myData = [[[NSData alloc] initWithContentsOfFile:appFile] autorelease];
    return myData;
}

@end
