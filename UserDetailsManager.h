//
//  UserDetailsManager.h
//  OperationQueue
//
//  Created by Naveen Katari on 28/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserDetails.h"

@interface UserDetailsManager : NSObject


@property (nonatomic, strong) NSMutableArray *arrUserNames;
@property UserDetails *userDetail;

-(NSMutableArray *) generateUserDetails;

@end
