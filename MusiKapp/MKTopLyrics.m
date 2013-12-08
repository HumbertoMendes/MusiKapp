//
//  MKTopLyrics.m
//  MusiKapp
//
//  Created by Humberto Mendes on 24/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import "MKTopLyrics.h"
#import "MKJsonHelper.h"
#import "MKUrls.h"

@implementation MKTopLyrics

@synthesize id,name,text;

-(NSArray*)searchRepository:(NSString *)idMusica{
    //http://www.vagalume.com.br/u2/index.js
    NSArray *music = [self searchForMusic:idMusica];
    return [self populateItems:music];
}

-(NSArray*)searchForMusic:(NSString*)musicId{
    NSString *stringUrl = [MKUrls searchMusicUrl:musicId];
    return [MKJsonHelper searchRepository:stringUrl andKey:@"mus"];
}

-(MKTopLyrics*)populateItems:(NSArray*)items{
    NSMutableArray *arrItems = nil;
    MKTopLyrics *item = nil;
    
    if(items != nil){
        MKTopLyrics *item = nil;
        arrItems = [[NSMutableArray alloc] init];
        // Obtendo cada um dos monitoramentos retornados e preenchendo o array.
        for(NSDictionary *itm in items) {
            item = [[MKTopLyrics alloc] init];
            item.id = [itm objectForKey:@"id"];
            item.name = [itm objectForKey:@"name"];
            item.text = [itm objectForKey:@"text"];
            
            [arrItems addObject:item];
        }
    }
    
    return item;
}

@end
