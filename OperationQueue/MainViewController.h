//
//  ViewController.h
//  OperationQueue
//
//  Created by Naveen Katari on 16/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageDetails.h"
#import "TableViewCell.h"
#import "UserDetails.h"


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnLoadMore;
@property (weak, nonatomic) IBOutlet UITableView *tableViewUsername;
@property (strong, nonatomic) ImageDetails *objImageDetails;
@property (strong, nonatomic) UserDetails *objUserDetails;

@end

