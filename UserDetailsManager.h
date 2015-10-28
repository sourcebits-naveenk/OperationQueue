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

-(NSMutableArray *) generateUserNameString;

@property UserDetails *userDetail;

@end