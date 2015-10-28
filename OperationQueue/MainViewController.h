//
//  ViewController.h
//  OperationQueue
//
//  Created by Naveen Katari on 16/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
#import "UserDetailsManager.h"
#import "ImageDetailsManager.h"


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnLoadMore;
@property (weak, nonatomic) IBOutlet UITableView *tableViewUsername;
@property (strong, nonatomic) ImageDetailsManager *objImageDetailsManager;
@property (strong, nonatomic) UserDetailsManager *objUserDetailsManager;

@end

