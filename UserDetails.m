//
//  UserDetails.m
//  OperationQueue
//
//  Created by Naveen Katari on 27/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "UserDetails.h"

@implementation UserDetails

-(instancetype)init{
    
    self = [ super init];
    
    if(self){
        
        _userImageURL = nil;
        _userName = nil;
    }
    
    return self;
}

@end
