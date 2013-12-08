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
#import "MKLyrics.h"
#import "MKAlbums.h"
#import "MKModelData.h"

@interface MKArtist : NSObject<MKModelData>
@property NSString* id;
@property NSString* name;
@property NSString* desc;
@property NSString* url;
@property NSString* pic_small;
@property NSString* pic_medium;
@property MKRank* rank;
@property MKGenre* genre;
@property NSMutableArray* related;
@property MKLyrics* topLyrics;
@property MKAlbums* albums;
@end
