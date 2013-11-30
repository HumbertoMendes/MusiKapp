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

-(NSArray*)searchRepository:(NSString *)text{
    //http://www.vagalume.com.br/u2/index.js
    text = [MKJsonLib formatParameterForUrl:text];
    NSString *stringUrl = [NSString stringWithFormat:@"http://www.vagalume.com.br/api/search.php?art=%@&extra=artpic", text];
    NSArray *artists = [MKJsonHelper searchRepository:stringUrl andKey:@"art"];
    
    return [self populateArtists:artists];
}

-(NSArray*)populateArtists:(NSArray*)artists{
    NSMutableArray *arrArtists = nil;
    if(artists != nil){
        MKArtist *artist = [[MKArtist alloc] init];
        arrArtists = [[NSMutableArray alloc] init];
        // Obtendo cada um dos monitoramentos retornados e preenchendo o array.
        for(NSDictionary *art in artists) {
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
