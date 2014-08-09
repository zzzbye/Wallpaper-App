//
//  DetailViewController.m
//  WallpaperApp
//
//  Created by Shawn Karan on 6/8/14.
//  Copyright (c) 2014 zzzbye. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) BOOL isButtonsVisible;

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
    
    [self.downloadButton addTarget:self action:@selector(downloadPressed:) forControlEvents:UIControlEventTouchUpInside];

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
//        self.downloadButton.alpha = 0;
    } completion: ^(BOOL finished) {//creates a variable (BOOL) called "finished" that is set to *YES* when animation IS completed.
        self.backButton.hidden = finished;//if animation is finished ("finished" == *YES*), then hidden = "finished" ... (aka hidden = *YES*)
        self.downloadButton.hidden = finished;
    }];
        self.isButtonsVisible = NO;
    }
    else {
        self.backButton.alpha = 0;
        self.backButton.hidden = NO;
        self.downloadButton.alpha = 0;
        self.downloadButton.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^{
            self.backButton.alpha = 1;
            self.downloadButton.alpha = 1;
        }];
        self.isButtonsVisible = YES;
    }
}

-(void)downloadPressed:(UIButton *)sender{
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, nil, nil);
    NSLog(@"Image Saved");
}

//- (IBAction)downloadButton:(UIButton *)sender {
//    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, nil, nil);
//    NSLog(@"Image Saved");
//}

@end
