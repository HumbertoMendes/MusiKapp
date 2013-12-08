//
//  MKItem.h
//  MusiKapp
//
//  Created by Humberto Mendes on 24/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKItem : NSObject
@property NSString* id;
@property NSString* desc;
@property NSString* url;
@property NSString* cover;
@property NSArray* discs;
@property UIImage* capa;

-(NSArray*)populateItems:(NSArray*)items;
@end
