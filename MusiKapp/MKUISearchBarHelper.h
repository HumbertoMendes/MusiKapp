//
//  MKUISearchBarHelper.h
//  MusiKapp
//
//  Created by Humberto Mendes on 23/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKModelData.h"
@protocol MKUISearchBarHelperDelegate<NSObject>
-(void)returnedData:(NSArray*)text;
@end

@interface MKUISearchBarHelper : NSObject<UISearchBarDelegate>{
    id<MKModelData> repository;
}

-(id)initWithRepository:(id<MKModelData>) initRepository;
@property(nonatomic,assign)id<MKUISearchBarHelperDelegate> delegate;

@end
