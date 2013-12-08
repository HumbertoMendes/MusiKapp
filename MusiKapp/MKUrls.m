//
//  MKUrls.m
//  MusiKapp
//
//  Created by Humberto Mendes on 01/12/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import "MKUrls.h"
#import "MKJsonLib.h"

@implementation MKUrls
+(NSString*)searchArtistUrl:(NSString*)artistName{
    artistName = [MKJsonLib formatParameterForUrl:artistName];
    NSString *url = @"http://www.vagalume.com.br/api/search.php?art=%@&extra=artpic";
    return [NSString stringWithFormat: url, artistName];
}

+(NSString*)searchAlbumUrl:(NSString*)artistName{
    artistName = [MKJsonLib formatArtistNameForUrl:artistName];
    NSString *url = @"http://www.vagalume.com.br/%@/discografia/index.js";
    return [NSString stringWithFormat: url, artistName];
}

+(NSString*)searchImageUrl:(NSString*)imageUrl{
    NSString *url = @"http://www.vagalume.com.br%@";
    return [NSString stringWithFormat: url, imageUrl];
}

+(NSString *)searchMusicUrl:(NSString *)musicUrl
{
    NSString *url = @"http://www.vagalume.com.br/api/search.php?musid=%@";
    return [NSString stringWithFormat: url, musicUrl];
}

@end
