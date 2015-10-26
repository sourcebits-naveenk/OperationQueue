//
//  DownloadImages.m
//  OperationQueue
//
//  Created by Naveen Katari on 16/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "DownloadImages.h"

@implementation DownloadImages

/*- (id)initWithPhotoRecord:(ImageDetails *)record atIndexPath:(NSIndexPath *)indexPath delegate:(id<DelegateDownlaodImages>) theDelegate
{
    
    if (self = [super init]) {
        // 2: Set the properties.
        self.delegate = theDelegate;
        self.indexpathForTableView = indexPath;
        self.imageDetails = record;
    }
    return self;
}*/

-(void) main
{
    NSData *dataOfImage = [[NSData alloc] initWithContentsOfURL: self.imageDetails.urlImage];
    if(self.isCancelled)
       {
           return;
       }
    
    if(self.isCancelled)
    {
        dataOfImage = nil;
        return;
    }
    if(dataOfImage)
    {
        UIImage *imageDownload = [UIImage imageWithData:dataOfImage];
        self.imageDetails.images = imageDownload;
    }
    else
    {
        self.imageDetails.isFailed = YES;
    }
    dataOfImage =  nil;
    
    if (self.isCancelled);
    {
        return;
    }
    
    [(NSObject *) self.delegate performSelectorOnMainThread:@selector(downloadImagesDidFinish:) withObject:self waitUntilDone:NO];
}

@end

