//
//  MKTopLyrics.h
//  MusiKapp
//
//  Created by Humberto Mendes on 24/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKItem.h"

@interface MKTopLyrics : NSObject
@property NSString* id;
@property NSString* name;
@property NSString* text;

-(NSArray*)searchForMusic:(NSString*)musicId;
-(NSArray*)populateItems:(NSArray*)items;

@end
