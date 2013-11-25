//
//  MKUISearchBarHelper.h
//  MusiKapp
//
//  Created by Humberto Mendes on 23/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKRepository.h"
@protocol MKUISearchBarHelperDelegate<NSObject>
-(void)searchedText:(NSString*)text;
@end

@interface MKUISearchBarHelper : NSObject<UISearchBarDelegate>{
    //id<MKUISearchBarHelperDelegate> delegate;
    id<MKRepository> repository;
}

-(id)initWithRepository:(id<MKRepository>) initRepository;
@property(nonatomic,assign)id<MKUISearchBarHelperDelegate> delegate;

@end
