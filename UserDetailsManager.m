//
//  UserDetailsManager.m
//  OperationQueue
//
//  Created by Naveen Katari on 28/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "UserDetailsManager.h"

@implementation UserDetailsManager

-(id) init
{
    
    _arrUserNames = [[NSMutableArray alloc] initWithObjects:_userDetail, nil];
    return self;
}
    int from =1;
    int to = 10;

-(NSMutableArray *) generateUserDetails
{
if(to <= 100)
{
    for(int i = from; i <= to; i++ )
    {
        _userDetail = [[UserDetails alloc]init];
        _userDetail.userName = [ NSString stringWithFormat:@"User%d", i];
        _userDetail.userImageURL = [NSString stringWithFormat:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_%d.jpg", (i% 10) + 1];
        //Adding Userdetails objects to array
        [_arrUserNames addObject:_userDetail];
    }
    
    from = from + 10;
    to = to + 10;

}
        return _arrUserNames;
}

@end
