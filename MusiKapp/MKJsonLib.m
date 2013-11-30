//
//  MKJsonLib.m
//  MusiKapp
//
//  Created by Humberto Mendes on 30/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import "MKJsonLib.h"

@implementation MKJsonLib
+(NSArray*)convertJsonToArray:(NSDictionary*)data withKey:(NSString*)key{
    NSMutableArray *jsonArray = [[NSMutableArray alloc] init];
    
    id keyValue = [data objectForKey:key];
    
    if ([keyValue isKindOfClass:[NSArray class]])
        return [data objectForKey:key];
    else{
        [jsonArray addObject:[data objectForKey:key]];
        return jsonArray;
    }
}

+(NSString*)formatParameterForUrl:(NSString*)parameter{
    return [parameter stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];;
}
@end
