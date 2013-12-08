//
//  MKUISearchBarHelper.m
//  MusiKapp
//
//  Created by Humberto Mendes on 23/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import "MKUISearchBarHelper.h"
#import "MKModelData.h"

@implementation MKUISearchBarHelper
@synthesize delegate;

-(id)initWithRepository:(id<MKModelData>) initRepository{
    if(self=[super init]){
        modelData = initRepository;
    }
    return self;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    if([delegate respondsToSelector:@selector(returnedData	:)])
    {
        [self performSelectorInBackground:@selector(searchForData:) withObject:searchBar.text];
    }
};

-(void)searchForData:(NSString*)text{
    NSArray *arrayReturn = [modelData searchRepository:text];
    [delegate returnedData:arrayReturn];
}

@end
