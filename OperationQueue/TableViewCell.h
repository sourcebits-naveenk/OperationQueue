//
//  TableViewCell.h
//  OperationQueue
//
//  Created by Naveen Katari on 27/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDetails.h"
@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *customImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;

@end
