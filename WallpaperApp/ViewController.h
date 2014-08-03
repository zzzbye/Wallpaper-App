//
//  ViewController.h
//  WallpaperApp
//
//  Created by Shawn Karan on 21/7/14.
//  Copyright (c) 2014 zzzbye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSMutableArray *wallPaperArray;

@end
