//
//  ViewController.m
//  OperationQueue
//
//  Created by Naveen Katari on 16/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "MainViewController.h"
#import "TableViewCell.h"

@interface ViewController ()
@property (nonatomic,strong) NSOperationQueue *operationQueue;
@end

//NSMutableArray *arrImage;
NSMutableArray *arrURL;
NSMutableArray *arrUserNames;
NSArray *tempArray;
NSDictionary *dictImages;
NSInteger *rowCount;
BOOL isLoaded;
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Registering Nib of TableViewCell
    [_tableViewUsername registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"CustomCell"];
    self.operationQueue = [[ NSOperationQueue alloc] init ];
    NSString *tempUserName;
    //Initialize arrUserNames Array
    arrUserNames = [[NSMutableArray alloc]init];
    //Loop generates user id from user1 to user 100
    for(NSInteger i = 1; i <=100; i++ )
    {
        
        tempUserName = [ NSString stringWithFormat:@"User%ld",(long)i];
        
        [ arrUserNames addObject:tempUserName];
    }
    //Storing the URLs into dictionary with url as key
    
    NSMutableDictionary  *dictUrl1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_1.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_2.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_3.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl4 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_4.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl5 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_5.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl6 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_6.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl7 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_7.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl8 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_8.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl9 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_9.jpg",@"url", nil];
    NSMutableDictionary  *dictUrl10 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_10.jpg",@"url", nil];
    
    arrURL = [NSMutableArray arrayWithObjects:dictUrl1,dictUrl2,dictUrl3,dictUrl4,dictUrl5,dictUrl6,dictUrl7,dictUrl8,dictUrl9,dictUrl10, nil];
    tempArray = [arrURL copy];
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
    return[arrURL count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
    TableViewCell *cell = (TableViewCell *)[_tableViewUsername dequeueReusableCellWithIdentifier:CellIdentifier];
    NSDate *object = arrURL[indexPath.row];
    rowCount = indexPath.row;
    cell.userName.text = [arrUserNames objectAtIndex:indexPath.row];
    
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
            UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:
                                                      [NSURL URLWithString:[object valueForKey:@"url"]]]];
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
    [arrURL addObjectsFromArray:tempArray];
    [_tableViewUsername reloadData];
}
@end

