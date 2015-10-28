//
//  ViewController.m
//  OperationQueue
//
//  Created by Naveen Katari on 16/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "MainViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSOperationQueue *operationQueue;
@end  

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   //Initializing modal class objects and calling the methods from those classes
    _objUserDetailsManager = [[UserDetailsManager alloc]init];
    _objImageDetailsManager = [[ImageDetailsManager alloc]init];
    [_objUserDetailsManager generateUserNameString];
    [_objImageDetailsManager getArrayWithUrl];
     //Registering Nib of TableViewCell
    [_tableViewUsername registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"CustomCell"];
    self.operationQueue = [[ NSOperationQueue alloc] init ];
   
    _tableViewUsername.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableViewUsername.estimatedRowHeight = 44.0;
    _tableViewUsername.rowHeight = UITableViewAutomaticDimension;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return[_objImageDetailsManager.arrURL count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
    TableViewCell *cell = (TableViewCell *)[_tableViewUsername dequeueReusableCellWithIdentifier:CellIdentifier];
    NSDate *object = _objImageDetailsManager.arrURL[indexPath.row];
    cell.userName.text = [_objUserDetailsManager.generateUserNameString objectAtIndex:indexPath.row];
    if ([object valueForKey:@"status"])
    {
        if([[object valueForKey:@"status"]isEqualToString:@"completed"] && [object valueForKey: @"image"]  && [[object valueForKey: @"image"] isKindOfClass:[UIImage class]])
        {
            cell.customImageView.contentMode = UIViewContentModeScaleToFill;
            cell.customImageView.image = [object valueForKey:@"image" ];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
    else
    {
        [object setValue:@"inprogress" forKey:@"status"];
        [self.operationQueue addOperationWithBlock:^
        {
            UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[object valueForKey:@"url"]]]];
            [object setValue:image forKey:@"image"];
            [object setValue:@"completed" forKey:@"status"];
            //count set
            [[NSOperationQueue mainQueue] addOperationWithBlock:^
            {
            [_tableViewUsername reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
            }];
        }];
        
    }
    return cell;
}
- (IBAction)btnLoadMore:(id)sender
{
    [_objImageDetailsManager.arrURL addObjectsFromArray:_objImageDetailsManager.arrURL];
    [_tableViewUsername reloadData];
}
@end

