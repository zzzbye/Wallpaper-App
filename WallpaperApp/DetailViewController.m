//
//  DetailViewController.m
//  WallpaperApp
//
//  Created by Shawn Karan on 6/8/14.
//  Copyright (c) 2014 zzzbye. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageView.image = self.wallpaperImage;
    
}

@end
