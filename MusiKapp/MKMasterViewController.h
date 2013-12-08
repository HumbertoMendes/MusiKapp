//
//  MKMasterViewController.h
//  MusiKapp
//
//  Created by Raffael Patrício de Souza on 07/12/13.
//  Copyright (c) 2013 raffaelps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "MKUISearchBarHelper.h"
#import "MKArtist.h"

@interface MKMasterViewController : UITableViewController <MKUISearchBarHelperDelegate, UITableViewDataSource, UITableViewDelegate>
{
    MKUISearchBarHelper *searchBar;
    NSMutableArray *albumItems;
}

@property (strong, nonatomic) IBOutlet UISearchBar *sbSearchArtist;
@property (weak, nonatomic) IBOutlet UITableView *tvAlbums;
@property (weak, nonatomic) IBOutlet UILabel *lbNomeArtista;

@end
