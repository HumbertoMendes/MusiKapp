//
//  MKJsonLib.h
//  MusiKapp
//
//  Created by Humberto Mendes on 30/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKJsonLib : NSObject
+(NSArray*)convertJsonToArray:(NSData*)data withKey:(NSString*)key;
+(NSString*)formatParameterForUrl:(NSString*)parameter;
+(NSString*)formatArtistNameForUrl:(NSString*)text;
+(NSString*)stringReplace:(NSString*)oldString withString:(NSString*)newString forText:(NSString*)text;
+(NSData*)convertJsonToData:(NSObject*)json;
@end