//
//  DetailViewController.h
//  WallpaperApp
//
//  Created by Shawn Karan on 6/8/14.
//  Copyright (c) 2014 zzzbye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) UIImage *wallpaperImage;

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UIButton *downloadButton;

@property (weak, nonatomic) IBOutlet UIImageView *lockscreenImageView;

@property (weak, nonatomic) IBOutlet UIImageView *homescreenImageView;

@property (weak, nonatomic) IBOutlet UIButton *lockscreenButton;

@property (weak, nonatomic) IBOutlet UIButton *homescreenButton;
@end
