//
//  MKUrls.h
//  MusiKapp
//
//  Created by Humberto Mendes on 01/12/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKUrls : NSObject
+(NSString*)searchArtistUrl:(NSString*)artistName;
+(NSString*)searchAlbumUrl:(NSString*)artistName;
@end
