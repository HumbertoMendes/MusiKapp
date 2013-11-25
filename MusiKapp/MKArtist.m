//
//  MKArtist.m
//  MusiKapp
//
//  Created by Humberto Mendes on 24/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import "MKArtist.h"
#import "MKJsonHelper.h"

@implementation MKArtist
@synthesize id;
@synthesize desc;
@synthesize url;
@synthesize pic_small;
@synthesize pic_medium;
@synthesize rank;
@synthesize genre;
@synthesize related;
@synthesize topLyrics;
@synthesize albums;

-(NSObject*)searchRepository:(NSString *)text{
    //http://www.vagalume.com.br/u2/index.js
    NSString *stringUrl = [NSString stringWithFormat:@"http://www.vagalume.com.br/api/search.php?art=%@", text];
    NSArray *artists = [MKJsonHelper searchRepository:stringUrl andKey:@"art"];
    //NSString *stringUrl = [NSString stringWithFormat:@"http://services.sandbox.encomendaz.net/tracking.json?id=%@", @"RA705639681BR"];
    //NSArray *monitoramentosJSON = [respostaJSON objectForKey:key];
    //NSArray *artists = [MKJsonHelper searchRepository:stringUrl andKey:@"data"];
    MKArtist *artist = [[MKArtist alloc] init];
    NSMutableArray *arrArtists = [[NSMutableArray alloc] init];
    
    // Obtendo cada um dos monitoramentos retornados e preenchendo o array.
    for(NSDictionary *art in artists) {
        artist.id = [art objectForKey:@"id"];
        artist.desc = [art objectForKey:@"date"];
        artist.url = [art objectForKey:@"state"];
        artist.pic_small = [art objectForKey:@"status"];
        artist.pic_medium = [art objectForKey:@"description"];
        //rastreio.resultado = [NSString stringWithFormat:@"Data: %@  - Cidade: %@ - Estado: %@ - Descrição: %@ - Status: %@", rastreio.date, rastreio.city, rastreio.state, rastreio.description, rastreio.status];
        
        [arrArtists addObject:artist];
    }
    return arrArtists;
}

@end
