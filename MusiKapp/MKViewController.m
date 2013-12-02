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
#import "MKUrls.h"

@interface MKViewController ()

@end

@implementation MKViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self delegateSearchBar];
    searchBar.delegate = self;
    _tvAlbums.delegate = self;
    _tvAlbums.dataSource = self;
    albumItems = [[NSMutableArray alloc]init];
    
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
        [self performSelectorInBackground:@selector(searchAlbums:) withObject:artist.url];
        _lbNomeArtista.text = artist.name;
        //NSLog(@"%@", artist.name);
        //NSLog(@"%@", artist.url);
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Atenção" message:@"Artista não encontrado." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    //TODO: Encapsular em um método.
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.view endEditing:YES];
    });
}

-(void)searchAlbums:(NSString*)artistUrl{
    MKAlbums *albums = [MKAlbums alloc];
    NSArray *arrAlbums = [albums searchRepository:artistUrl];
    [albumItems removeAllObjects];
    for(MKItem *item in [arrAlbums objectAtIndex:0]){
        [albumItems addObject:item];
    }
    [_tvAlbums reloadData];
}

//TODO: Desacoplar implementação
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [albumItems count];
};

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    MKItem *item = (MKItem*)[albumItems objectAtIndex:indexPath.row];
    
    //TODO: Desacoplar requisição
    //TODO: Fazer cache
    //TODO: Inserir capa caso a mesma não exista
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0ul);
    dispatch_async(queue, ^{
        NSString *url = [MKUrls searchImageUrl:item.cover];
        //NSString *u=[NSString stringWithContentsOfFile:url encoding:NSUTF8StringEncoding error:nil];
        NSURL *imageURL=[NSURL URLWithString:url];
        NSData *image=[NSData dataWithContentsOfURL:imageURL];
        //[image writeToFile:[pat stringByAppendingPathComponent:@"image.png"] atomically:YES];
        dispatch_sync(dispatch_get_main_queue(), ^{
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            //cell.imageView.image=[UIImage imageWithContentsOfFile:[pat stringByAppendingPathComponent:@"image.png"]];
            cell.imageView.image = [UIImage imageWithData:image];
            [cell setNeedsLayout];
            NSLog(@"Download");
        });
    });
    cell.imageView.image=[UIImage imageNamed:@"placeholder"];
    cell.textLabel.text = item.desc;
    return cell;
};

@end
