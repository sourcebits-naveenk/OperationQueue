//
//  UserDetails.m
//  OperationQueue
//
//  Created by Naveen Katari on 27/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "UserDetails.h"

@implementation UserDetails

//MEthod generate the strings from User1 to User100

-(void) generateUserNameString
{
      _arrUserNames = [[NSMutableArray alloc ]init];
    for(int i = 1; i <=100; i++ )
    {
        
        _userName = [ NSString stringWithFormat:@"User%d",i];
        
        [self.arrUserNames addObject:_userName];
    }
}

@end
