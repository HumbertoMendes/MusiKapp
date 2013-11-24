//
//  MKViewController.m
//  MusiKapp
//
//  Created by Humberto Mendes on 23/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import "MKViewController.h"
#import "MKUISearchBarHelper.h"

@interface MKViewController ()

@end

@implementation MKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self delegateSearchBar];
    searchBar.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)searchArtist{
    
}

-(void)delegateSearchBar{
    searchBar = [MKUISearchBarHelper alloc];
    _sbSearchArtist.delegate = searchBar;
}

-(void)searchedText:(NSString*)text{
    NSLog(@"%@", text);
}

@end
