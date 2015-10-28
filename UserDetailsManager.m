//
//  UserDetailsManager.m
//  OperationQueue
//
//  Created by Naveen Katari on 28/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "UserDetailsManager.h"

@implementation UserDetailsManager

-(NSMutableArray *) generateUserNameString
{
    _userDetail = [[UserDetails alloc]init];
    _userDetail.arrUserNames = [[NSMutableArray alloc]init];
    for(int i = 1; i <=100; i++ )
    {
        
        _userDetail.userName = [ NSString stringWithFormat:@"User%d",i];
        
        [_userDetail.arrUserNames addObject:_userDetail.userName];
    }
    return _userDetail.arrUserNames;
}


@end
