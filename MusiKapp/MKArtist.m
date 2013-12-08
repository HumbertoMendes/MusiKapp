//
//  MKArtist.m
//  MusiKapp
//
//  Created by Humberto Mendes on 24/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import "MKArtist.h"
#import "MKJsonHelper.h"
#import "MKJsonLib.h"
#import "MKUrls.h"

@implementation MKArtist
@synthesize id;
@synthesize name;
@synthesize desc;
@synthesize url;
@synthesize pic_small;
@synthesize pic_medium;
@synthesize rank;
@synthesize genre;
@synthesize related;
@synthesize topLyrics;
@synthesize albums;

-(NSArray*)searchRepository:(NSString *)searchText{
    //http://www.vagalume.com.br/u2/index.js
    NSArray *artists = [self searchForArtists:searchText];
    return [self populateArtists:artists];
}

-(NSArray*)searchForArtists:(NSString*)artistName{
    NSString *stringUrl = [MKUrls searchArtistUrl:artistName];
    return [MKJsonHelper searchRepository:stringUrl andKey:@"art"];
}

-(NSArray*)populateArtists:(NSArray*)artists{
    NSMutableArray *arrArtists = nil;
    if(artists != nil){
        MKArtist *artist = nil;
        arrArtists = [[NSMutableArray alloc] init];
        // Obtendo cada um dos monitoramentos retornados e preenchendo o array.
        for(NSDictionary *art in artists) {
            artist = [[MKArtist alloc] init];
            artist.id = [art objectForKey:@"id"];
            artist.name = [art objectForKey:@"name"];
            artist.url = [art objectForKey:@"url"];
            artist.pic_small = [art objectForKey:@"pic_small"];
            artist.pic_medium = [art objectForKey:@"pic_medium"];
            [arrArtists addObject:artist];
        }
    }
    return arrArtists;
}

@end
