//
//  ViewController.m
//  WallpaperApp
//
//  Created by Shawn Karan on 21/7/14.
//  Copyright (c) 2014 zzzbye. All rights reserved.
//

#import "ViewController.h"
#import "ImagePost.h"
#import "UIImageView+WebCache.h"
#import "WallpaperCell.h"
#import "DetailViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *imageURL = [NSURL URLWithString:@"https://www.googleapis.com/storage/v1/b/abstract/o"];
    NSData *jsonData = [NSData dataWithContentsOfURL:imageURL];
    
    NSError *error = nil;
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    self.wallPaperArray = [NSMutableArray array];
    
    self.storeImageArray = [NSMutableArray array];

    
    NSArray *imagePostArray = [dataDictionary objectForKey:@"items"];
    for (NSDictionary *ipDictionary in imagePostArray) {
        ImagePost *imgPost = [ImagePost imagePostWithURL:[ipDictionary objectForKey:@"mediaLink"]];
        
        NSURL *wpURL = [NSURL URLWithString:imgPost.wallPaper];
        NSData *imgData = [NSData dataWithContentsOfURL:wpURL];
        self.tempImage = [UIImage imageWithData:imgData];
        
        [self.wallPaperArray addObject:imgPost];
        [self.storeImageArray addObject:self.tempImage];
    }
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Collection View Methods

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.wallPaperArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = nil;
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    WallpaperCell *wallpaperCell = (WallpaperCell *)cell;
    
    ImagePost *imgPost = [self.wallPaperArray objectAtIndex:indexPath.row];

    NSURL *wpURL = [NSURL URLWithString:imgPost.wallPaper];
//    NSData *imgData = [NSData dataWithContentsOfURL:wpURL];
//    imageView.image = [UIImage imageWithData:imgData];
    [wallpaperCell.thumbnailImageView sd_setImageWithURL:wpURL
                placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    [self.storeImageArray addObject:self.tempImage];

    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"fullviewSegue"]){
        DetailViewController *vc = (DetailViewController *)segue.destinationViewController;
        
        UICollectionViewCell *cell = (UICollectionViewCell *)sender;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
        UIImage *image = [self.storeImageArray objectAtIndex:indexPath.row];
        vc.wallpaperImage = image;
        
    }
}

-(IBAction)unwindToRootVC:(UIStoryboardSegue *)segue
{
    //Nothing needed here
}

@end
