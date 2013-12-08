//
//  MKLetraViewController.m
//  MusiKapp
//
//  Created by Raffael Patrício de Souza on 07/12/13.
//  Copyright (c) 2013 raffaelps. All rights reserved.
//

#import "MKLetraViewController.h"
#import "MKTopLyrics.h"
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

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    MKTopLyrics *musica = [MKTopLyrics alloc];
    NSString *url = [MKUrls searchMusicUrl:idMusica];
    MKTopLyrics *musicaCompleta = [musica searchForMusic:url];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
