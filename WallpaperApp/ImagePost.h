//
//  ImagePost.h
//  WallpaperApp
//
//  Created by Shawn Karan on 3/8/14.
//  Copyright (c) 2014 zzzbye. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImagePost : NSObject

@property (nonatomic, strong) NSString *wallPaper;

- (id) initWithImageURL:(NSString *) wpURL;
+ (id) imagePostWithURL:(NSString *) wpURL;

- (NSURL *) wallPaperURL;

@end
