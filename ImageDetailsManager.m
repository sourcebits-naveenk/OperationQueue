//
//  ImageDetailsManager.m
//  OperationQueue
//
//  Created by Naveen Katari on 28/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "ImageDetailsManager.h"

@implementation ImageDetailsManager
//Method will get the array of dictionaries with image Urls
-(void) getArrayWithUrl
{

    NSMutableDictionary  *dictUrl1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_1.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_2.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_3.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl4 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_4.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl5 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_5.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl6 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_6.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl7 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_7.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl8 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_8.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl9 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_9.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl10 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_10.jpg",@"url", nil];

    _arrURL = [NSMutableArray arrayWithObjects:dictUrl1,dictUrl2,dictUrl3,dictUrl4,dictUrl5,dictUrl6,dictUrl7,dictUrl8,dictUrl9,dictUrl10, nil];

}

@end
