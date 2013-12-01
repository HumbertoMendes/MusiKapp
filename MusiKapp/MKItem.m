//
//  MKItem.m
//  MusiKapp
//
//  Created by Humberto Mendes on 24/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import "MKItem.h"

@implementation MKItem
@synthesize id;
@synthesize desc;
@synthesize url;
@synthesize cover;
@synthesize discs;

-(NSArray*)populateItems:(NSArray*)items{
    NSMutableArray *arrItems = nil;
    if(items != nil){
        MKItem *item = nil;
        arrItems = [[NSMutableArray alloc] init];
        // Obtendo cada um dos monitoramentos retornados e preenchendo o array.
        for(NSDictionary *itm in items) {
            item = [[MKItem alloc] init];
            item.id = [itm objectForKey:@"id"];
            item.desc = [itm objectForKey:@"desc"];
            item.url = [itm objectForKey:@"url"];
            item.cover = [itm objectForKey:@"cover"];
            //TODO item.discs;
            [arrItems addObject:item];
        }
    }
    return arrItems;
}

@end
