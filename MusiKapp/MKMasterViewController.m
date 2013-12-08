//
//  MKMasterViewController.m
//  MusiKapp
//
//  Created by Raffael Patrício de Souza on 07/12/13.
//  Copyright (c) 2013 raffaelps. All rights reserved.
//

#import "MKMasterViewController.h"
#import "MKDetailViewController.h"
#import "MKUISearchBarHelper.h"
#import "MKArtist.h"
#import "MKAlbums.h"
#import "MKUrls.h"

@interface MKMasterViewController ()

@end

@implementation MKMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self delegateSearchBar];
    searchBar.delegate = self;
    _tvAlbums.delegate = self;
    _tvAlbums.dataSource = self;
    albumItems = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)delegateSearchBar
{
    MKArtist *artist = [MKArtist alloc];
    searchBar = [[MKUISearchBarHelper alloc] initWithRepository:artist];
    _sbSearchArtist.delegate = searchBar;
}

-(void)returnedData:(NSArray*)artists
{
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

-(void)searchAlbums:(NSString*)artistUrl
{
    MKAlbums *albums = [MKAlbums alloc];
    NSArray *arrAlbums = [albums searchRepository:artistUrl];
    [albumItems removeAllObjects];
    for(MKItem *item in [arrAlbums objectAtIndex:0]){
        [albumItems addObject:item];
    }
    [_tvAlbums reloadData];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [albumItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    MKItem *item = (MKItem*)[albumItems objectAtIndex:indexPath.row];
    
    //TODO: Desacoplar requisição
    //TODO: Fazer cache
    //TODO: Inserir capa caso a mesma não exista
    
    if (![item capa])
    {
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
                [item setCapa:[UIImage imageWithData:image]];
                NSLog(@"Download");
            });
        });
    }
    else
    {
        cell.imageView.image = item.capa;
    }
    
    cell.textLabel.text = item.desc;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MKItem *object = [albumItems objectAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Fetched results controller

/*
// Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed. 
 
 - (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}
 */

@end
