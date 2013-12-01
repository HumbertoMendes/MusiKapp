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
#import "MKAlbums.h"

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

-(void)delegateSearchBar{
    MKArtist *artist = [MKArtist alloc];
    searchBar = [[MKUISearchBarHelper alloc] initWithRepository:artist];    
    _sbSearchArtist.delegate = searchBar;
}

-(void)returnedData:(NSArray*)artists{
    if(artists != nil){
        MKArtist *artist = (MKArtist*) [artists objectAtIndex:0];
        [self performSelectorInBackground:@selector(searchAlbums:) withObject:artist.name];
        NSLog(@"%@", artist.name);
        NSLog(@"%@", artist.url);
    }else{
        NSLog(@"Artista não encontrado");
    }
}

-(void)searchAlbums:(NSString*)artistName{
    MKAlbums *albums = [MKAlbums alloc];
    NSArray *arrAlbums = [albums searchRepository:artistName];
    for(MKItem *item in [arrAlbums objectAtIndex:0]){
        NSLog(@"-------------------");
        NSLog(@"%@", item.id);
        NSLog(@"%@", item.desc);
        NSLog(@"%@", item.url);
        NSLog(@"%@", item.cover);
    }
}

@end
