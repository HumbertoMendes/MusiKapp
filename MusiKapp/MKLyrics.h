//
//  MKTopLyrics.h
//  MusiKapp
//
//  Created by Humberto Mendes on 24/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKItem.h"
#import "MKModelData.h"

@interface MKLyrics : NSObject<MKModelData>
@property NSString* id;
@property NSString* name;
@property NSString* text;

-(MKLyrics*)searchRepository:(NSString*)idMusica;
-(MKLyrics*)populateItems:(NSArray*)items;

@end
