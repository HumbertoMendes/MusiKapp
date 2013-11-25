//
//  MKArtist.h
//  MusiKapp
//
//  Created by Humberto Mendes on 24/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKRank.h"
#import "MKGenre.h"
#import "MKTopLyrics.h"
#import "MKAlbums.h"
#import "MKRepository.h"

@interface MKArtist : NSObject<MKRepository>
@property NSString* id;
@property NSString* desc;
@property NSString* url;
@property NSString* pic_small;
@property NSString* pic_medium;
@property MKRank* rank;
@property MKGenre* genre;
@property NSMutableArray* related;
@property MKTopLyrics* topLyrics;
@property MKAlbums* albums;
@end
