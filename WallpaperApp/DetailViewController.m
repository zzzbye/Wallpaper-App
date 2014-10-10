//
//  DetailViewController.m
//  WallpaperApp
//
//  Created by Shawn Karan on 6/8/14.
//  Copyright (c) 2014 zzzbye. All rights reserved.
//

#import "DetailViewController.h"
#import "ProgressHUD.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) BOOL isButtonsVisible;
@property (nonatomic) BOOL isLockscreenVisible;
@property (nonatomic) BOOL isHomescreenVisible;

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
    
    self.isButtonsVisible = YES;
    self.isLockscreenVisible = NO;
    self.isHomescreenVisible = NO;
    
    self.lockscreenImageView.alpha = 0;
    self.homescreenImageView.alpha = 0;
    
    [self.downloadButton addTarget:self action:@selector(downloadPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.lockscreenButton addTarget:self action:@selector(lockscreenPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.homescreenButton addTarget:self action:@selector(homescreenPressed:) forControlEvents:UIControlEventTouchUpInside];

}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)oneTapRecognized:(UITapGestureRecognizer *) sender
{
    if (self.isButtonsVisible == YES) {
    [UIView animateWithDuration:0.3 animations:^{
        self.backButton.alpha = 0;
        self.downloadButton.alpha = 0;
        self.lockscreenButton.alpha = 0;
        self.homescreenButton.alpha = 0;
    } completion: ^(BOOL finished) {
        self.backButton.hidden = finished;
        self.downloadButton.hidden = finished;
        self.lockscreenButton.hidden = finished;
        self.homescreenButton.hidden = finished;
    }];
        self.isButtonsVisible = NO;
    }
    else {
        self.backButton.alpha = 0;
        self.backButton.hidden = NO;
        self.downloadButton.alpha = 0;
        self.downloadButton.hidden = NO;
        self.lockscreenButton.alpha = 0;
        self.lockscreenButton.hidden = NO;
        self.homescreenButton.alpha = 0;
        self.homescreenButton.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^{
            self.backButton.alpha = 1;
            self.downloadButton.alpha = 1;
            self.lockscreenButton.alpha = 1;
            self.homescreenButton.alpha = 1;
        }];
        self.isButtonsVisible = YES;
    }
}

-(void)downloadPressed:(UIButton *)sender{
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, nil, nil);
    [ProgressHUD showSuccess:@"Saved to Photos"];
    //NSLog(@"Image Saved");
}

-(void)lockscreenPressed:(UIButton *)sender{
    if (self.lockscreenImageView.alpha == 0) {
        [UIView animateWithDuration:0.3 animations:^{
            self.backButton.alpha = 0;
            self.downloadButton.alpha = 0;
            self.lockscreenButton.alpha = 0;
            self.homescreenButton.alpha = 0;
            self.lockscreenImageView.alpha = 1;
            self.homescreenImageView.alpha = 0;
        } completion: ^(BOOL finished) {
            self.backButton.hidden = finished;
            self.downloadButton.hidden = finished;
            self.lockscreenButton.hidden = finished;
            self.homescreenButton.hidden = finished;
        }];
        self.isButtonsVisible = NO;
    }
    else {
        [UIView animateWithDuration:0.3 animations:^{
            self.backButton.alpha = 1;
            self.downloadButton.alpha = 1;
            self.lockscreenButton.alpha = 1;
            self.homescreenButton.alpha = 1;
            self.lockscreenImageView.alpha = 0;
        }];
        self.isButtonsVisible = YES;
    }

}

-(void)homescreenPressed:(UIButton *)sender{
    if (self.homescreenImageView.alpha == 0) {
        [UIView animateWithDuration:0.3 animations:^{
            self.backButton.alpha = 0;
            self.downloadButton.alpha = 0;
            self.lockscreenButton.alpha = 0;
            self.homescreenButton.alpha = 0;
            self.homescreenImageView.alpha = 1;
            self.lockscreenImageView.alpha = 0;
        } completion: ^(BOOL finished) {
            self.backButton.hidden = finished;
            self.downloadButton.hidden = finished;
            self.lockscreenButton.hidden = finished;
            self.homescreenButton.hidden = finished;
        }];
        self.isButtonsVisible = NO;
    }
    else {
        [UIView animateWithDuration:0.3 animations:^{
            self.backButton.alpha = 1;
            self.downloadButton.alpha = 1;
            self.lockscreenButton.alpha = 1;
            self.homescreenButton.alpha = 1;
            self.homescreenImageView.alpha = 0;
        }];
        self.isButtonsVisible = YES;
    }
    
}

@end
