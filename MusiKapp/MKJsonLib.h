//
//  MKJsonLib.h
//  MusiKapp
//
//  Created by Humberto Mendes on 30/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKJsonLib : NSObject
+(NSArray*)convertJsonToArray:(NSDictionary*)data withKey:(NSString*)key;
+(NSString*)formatParameterForUrl:(NSString*)parameter;
@end
