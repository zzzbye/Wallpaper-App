//
//  WallpaperViewController.m
//  WallpaperApp
//
//  Created by Shawn Karan on 5/8/14.
//  Copyright (c) 2014 zzzbye. All rights reserved.
//

#import "WallpaperViewController.h"

@interface WallpaperViewController ()

@end

@implementation WallpaperViewController

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
    
    self.view.backgroundColor=[UIColor blackColor];
    
//    self.wallpaperImageView.image = [UIImage imageNamed:@"placeholder.png"];
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    self.navigationController.navigationBar.hidden = YES;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
