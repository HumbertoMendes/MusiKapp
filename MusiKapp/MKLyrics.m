//
//  MKTopLyrics.m
//  MusiKapp
//
//  Created by Humberto Mendes on 24/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import "MKLyrics.h"
#import "MKJsonHelper.h"
#import "MKUrls.h"

@implementation MKLyrics

@synthesize id,name,text;

-(MKLyrics*)searchRepository:(NSString *)searchText{
    //http://www.vagalume.com.br/u2/index.js
    NSArray *music = [self searchForMusic:searchText];
    return [self populateItems:music];
}

-(NSArray*)searchForMusic:(NSString*)musicId{
    NSString *stringUrl = [MKUrls searchMusicUrl:musicId];
    return [MKJsonHelper searchRepository:stringUrl andKey:@"mus"];
}

-(MKLyrics*)populateItems:(NSArray*)items{
    NSMutableArray *arrItems = nil;
    
    if(items != nil){
        MKLyrics *item = nil;
        arrItems = [[NSMutableArray alloc] init];
        // Obtendo cada um dos monitoramentos retornados e preenchendo o array.
        for(NSDictionary *itm in items) {
            item = [[MKLyrics alloc] init];
            item.id = [itm objectForKey:@"id"];
            item.name = [itm objectForKey:@"name"];
            item.text = [itm objectForKey:@"text"];
            
            [arrItems addObject:item];
        }
    }
    
    return [arrItems objectAtIndex:0];
}

@end
