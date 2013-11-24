//
//  MKUISearchBarHelper.m
//  MusiKapp
//
//  Created by Humberto Mendes on 23/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import "MKUISearchBarHelper.h"
#import "MKRepository.h"

@implementation MKUISearchBarHelper
@synthesize delegate;

-(id)initWithRepository:(id<MKRepository>) initRepository{
    if(self=[super init]){
        repository = initRepository;
    }
    return self;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [repository searchRepository:searchBar.text];
    //NSLog(@"%@", searchBar.text);
    if([delegate respondsToSelector:@selector(searchedText:)])
    {
        [delegate searchedText:searchBar.text];
    }
};


@end
