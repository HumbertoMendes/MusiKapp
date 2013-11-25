//
//  MKJsonHelper.h
//  MusiKapp
//
//  Created by Humberto Mendes on 24/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKRepository.h"

@interface MKJsonHelper : NSObject
+(NSArray*)searchRepository:(NSString*)stringUrl andKey:(NSString*)key;
@end
