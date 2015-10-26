//
//  ImageDetails.h
//  OperationQueue
//
//  Created by Naveen Katari on 16/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageDetails : NSObject

@property (nonatomic, strong) NSString *stringImageName;
@property (nonatomic, strong) UIImage *images;
@property (nonatomic, strong) NSURL *urlImage;
@property (nonatomic, assign) BOOL *isFailed;

@end
