//
//  MKDiscs.m
//  MusiKapp
//
//  Created by Raffael Patrício de Souza on 07/12/13.
//  Copyright (c) 2013 raffaelps. All rights reserved.
//

#import "MKDiscs.h"

@implementation MKDiscs

@synthesize id,desc;

-(NSArray *)populateDiscs:(NSArray *)discs
{
    NSMutableArray *arrDiscs = nil;
    if(discs != nil){
        MKDiscs *item = nil;
        arrDiscs = [[NSMutableArray alloc] init];
        
        for(NSDictionary *itm in discs) {
            item = [[MKDiscs alloc] init];
            item.id = [itm objectForKey:@"id"];
            item.desc = [itm objectForKey:@"desc"];
            [arrDiscs addObject:item];
        }
    }
    return arrDiscs;
}

@end
