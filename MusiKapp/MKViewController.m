//
//  MKViewController.m
//  MusiKapp
//
//  Created by Humberto Mendes on 23/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import "MKViewController.h"
#import "MKUISearchBarHelper.h"
#import "MKArtist.h"

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
    MKArtist *artist = [MKArtist alloc];
    searchBar = [[MKUISearchBarHelper alloc] initWithRepository:artist];    
    _sbSearchArtist.delegate = searchBar;
}

-(void)returnedData:(NSArray*)artists{
    if(artists != nil){
        /*for(MKArtist *artist in artists) {
            NSLog(@"%@", artist.name);
            NSLog(@"%@", artist.url);
        }*/
        MKArtist *artist = (MKArtist*) [artists objectAtIndex:0];
        NSLog(@"%@", artist.name);
        NSLog(@"%@", artist.url);
    }else{
        NSLog(@"Artista não encontrado");
    }
}

@end
