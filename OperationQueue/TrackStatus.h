//
//  TrackStatus.h
//  OperationQueue
//
//  Created by Naveen Katari on 16/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrackStatus : NSObject

@property (nonatomic, strong) NSMutableDictionary *dictionaryImagesDownloading;
@property (nonatomic, strong) NSOperationQueue *queueDownloadingImages;
@end
