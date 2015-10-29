//
//  ImageDetailsManager.h
//  OperationQueue
//
//  Created by Naveen Katari on 28/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageDetailsManager : NSObject

@property (nonatomic, strong) NSMutableArray *arrURL;
-(void) getArrayWithUrl;


@end
