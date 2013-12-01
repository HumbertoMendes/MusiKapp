//
//  MKViewController.h
//  MusiKapp
//
//  Created by Humberto Mendes on 23/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKUISearchBarHelper.h"
#import "MKArtist.h"


@interface MKViewController : UIViewController<MKUISearchBarHelperDelegate>{
    MKUISearchBarHelper *searchBar;
}
@property (strong, nonatomic) IBOutlet UISearchBar *sbSearchArtist;
@end