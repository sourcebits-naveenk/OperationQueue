//
//  DownloadImages.h
//  OperationQueue
//
//  Created by Naveen Katari on 16/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageDetails.h"

@protocol DelegateDownlaodImages <NSObject>
 //-(void)downloadImagesDidFinish: (DownloadImages *) imageDownloader;
@end
@interface DownloadImages : NSOperation

@property (nonatomic, assign) id <DelegateDownlaodImages> delegate;
@property (nonatomic, strong) NSIndexPath *indexpathForTableView;
@property (nonatomic, strong) ImageDetails *imageDetails;

- (id)initWithPhotoRecord:(ImageDetails *)record atIndexPath:(NSIndexPath *)indexPath delegate:(id<DelegateDownlaodImages>) theDelegate;
@end
