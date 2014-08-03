//
//  ImagePost.m
//  WallpaperApp
//
//  Created by Shawn Karan on 3/8/14.
//  Copyright (c) 2014 zzzbye. All rights reserved.
//

#import "ImagePost.h"

@implementation ImagePost

- (id) initWithImageURL:(NSString *) wpURL{
    self = [super init];
    
    if (self){
        self.wallPaper = wpURL;
    }
    return self;
}

+ (id) imagePostWithURL:(NSString *) wpURL{
    return [[self alloc] initWithImageURL:wpURL];
}

- (NSURL *) wallPaperURL{
    return [NSURL URLWithString:self.wallPaper];
}

@end
