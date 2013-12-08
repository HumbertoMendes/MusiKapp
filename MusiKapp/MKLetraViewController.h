//
//  MKLetraViewController.h
//  MusiKapp
//
//  Created by Raffael Patrício de Souza on 07/12/13.
//  Copyright (c) 2013 raffaelps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MKLetraViewController : UIViewController
@property (nonatomic,retain) NSString *idMusica;
@property (weak, nonatomic) IBOutlet UILabel *lbNomeMusica;
@property (weak, nonatomic) IBOutlet UITextView *tvLetraMusica;
@end