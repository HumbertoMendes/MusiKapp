//
//  MKDiscs.h
//  MusiKapp
//
//  Created by Raffael Patrício de Souza on 07/12/13.
//  Copyright (c) 2013 raffaelps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKDiscs : NSObject
@property NSString* id;
@property NSString* desc;

-(NSArray*)populateDiscs:(NSArray*)discs;

@end
