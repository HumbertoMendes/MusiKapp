//
//  MKAlbums.m
//  MusiKapp
//
//  Created by Humberto Mendes on 24/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import "MKAlbums.h"
#import "MKItem.h"
#import "MKUrls.h"
#import "MKJsonHelper.h"
#import "MKJsonLib.h"

@implementation MKAlbums
-(NSArray*)searchRepository:(NSString *)text{
    //http://www.vagalume.com.br/u2/index.js
    NSArray *albums = [self searchForAlbums:text];
    return [self populateAlbum:albums];
}

-(NSArray*)searchForAlbums:(NSString*)artistUrl{
    NSString *stringUrl = [MKUrls searchAlbumUrl:artistUrl];
    return [MKJsonHelper searchRepository:stringUrl andKey:@"discography"];
}

-(NSArray*)populateAlbum:(NSArray*)albums{
    NSMutableArray *arrAlbums = [[NSMutableArray alloc] init];
    if(albums != nil){
        NSData *data = [MKJsonLib convertJsonToData:[albums objectAtIndex:0]];
        NSArray *arrItems = nil;
        @try {
            arrItems = [MKJsonLib convertJsonToArray:data withKey:@"item"];
        }
        @catch (NSException *exception) {
            NSLog(@"%@", exception.reason);
        }
        if(arrItems!=nil){
            MKItem *item = [[MKItem alloc] init];
            arrItems = [item populateItems:arrItems];
            [arrAlbums addObject:arrItems];
        }
    }
    return arrAlbums;
}
@end
