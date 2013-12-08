//
//  MKLetraViewController.m
//  MusiKapp
//
//  Created by Raffael Patrício de Souza on 07/12/13.
//  Copyright (c) 2013 raffaelps. All rights reserved.
//

#import "MKLetraViewController.h"
#import "MKLyrics.h"
#import "MKUrls.h"

@interface MKLetraViewController ()

@end

@implementation MKLetraViewController

@synthesize idMusica;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setDetailItem:(NSString*)newDetailItem
{
    idMusica = newDetailItem;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    MKLyrics *musica = [MKLyrics alloc];
    musica = [musica searchRepository:idMusica];
    _lbNomeMusica.text = musica.name;
    _tvLetraMusica.text = musica.text;
    [_tvLetraMusica sizeToFit];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
