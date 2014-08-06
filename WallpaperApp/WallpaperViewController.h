//
//  WallpaperViewController.h
//  WallpaperApp
//
//  Created by Shawn Karan on 5/8/14.
//  Copyright (c) 2014 zzzbye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagePost.h"

@interface WallpaperViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *wallpaperImageView;

@property (strong, nonatomic) ImagePost *imagePostObject;

@end
