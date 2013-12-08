//
//  MKDetailViewController.h
//  MusiKapp
//
//  Created by Raffael Patrício de Souza on 07/12/13.
//  Copyright (c) 2013 raffaelps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKItem.h"

@interface MKDetailViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *arrayMusicas;
}

@property (strong, nonatomic) MKItem *detailItem;

@end
