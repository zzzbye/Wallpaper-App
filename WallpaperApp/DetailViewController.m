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
    
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneTapRecognized:)];
    
    tapped.numberOfTapsRequired = 1;

    tapped.numberOfTouchesRequired = 1;
    
    [self.view addGestureRecognizer:tapped];
    
    //Assign image from selected UICollectionView cell
    self.imageView.image = self.wallpaperImage;
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)oneTapRecognized:(UITapGestureRecognizer *) sender
{
    NSLog(@"Single Tap Recognized");
}

@end
