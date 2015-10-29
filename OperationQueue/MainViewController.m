//
//  ViewController.m
//  OperationQueue
//
//  Created by Naveen Katari on 16/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "MainViewController.h"
#import "UserDetails.h"


@interface ViewController ()
@property (nonatomic,strong) NSOperationQueue *operationQueue;

@end  

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   //Initializing modal class objects and calling the methods from those classes
    _objUserDetailsManager = [[UserDetailsManager alloc]init];
    [_objUserDetailsManager generateUserDetails];
     //Registering Nib of TableViewCell
    [_tableViewUsername registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"CustomCell"];
    self.operationQueue = [[ NSOperationQueue alloc] init ];
    
 //   _tableViewUsername.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
//    _tableViewUsername.estimatedRowHeight = 44.0;
//    _tableViewUsername.rowHeight = UITableViewAutomaticDimension;
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
    //NSInteger rowCount =[_objUserDetailsManager.generateUserDetails count];
    
    return [ self.objUserDetailsManager.arrUserNames count ];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserDetails *userDetails = [_objUserDetailsManager.arrUserNames objectAtIndex:indexPath.row];
    static NSString *CellIdentifier = @"CustomCell";
    __weak TableViewCell *cell = (TableViewCell *)[_tableViewUsername dequeueReusableCellWithIdentifier:CellIdentifier];
//    if(cell == nil)
//    {
//        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]];
//    }

    
    //NSMutableDictionary *object = [ NSMutableDictionary dictionaryWithObjectsAndKeys:userDetails.userImageURL,@"image", nil] ;
    
    //cell.userName.text = [_objUserDetailsManager.generateUserDetails objectAtIndex:indexPath.row];
    
    
    //cell.userName.text = [_objUserDetailsManager.generateUserDetails objectAtIndex:indexPath.row];
    cell.userName.text = userDetails.userName;
    //cell.customImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:userDetails.userImageURL]]];
    
    
    
    
    // Add an operation as a block to a queue
    [self.operationQueue addOperationWithBlock: ^ {
        
        NSURL *aURL = [NSURL URLWithString:userDetails.userImageURL];
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:aURL options:nil error:&error];
        UIImage *image = nil;
    
        if (data){
            image = [UIImage imageWithData:data];
            
            // Update UI on the main thread.
            [[NSOperationQueue mainQueue] addOperationWithBlock: ^ {
                cell.customImageView.image = image;
                cell.customImageView.contentMode = UIViewContentModeScaleToFill;
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }];
        }
    }];
    
    
    
    
//    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    //this will start the image loading in bg
//    dispatch_async(concurrentQueue, ^{
////        NSURL *imageURL = [NSURL URLWithString:[[self.listOfPlaceDetails objectAtIndex:indexPath.row]objectForKey:@"imageCell"]];
////        
////        NSData *image = [[NSData alloc] initWithContentsOfURL:imageURL];
//        
//        UIImage * img = [UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString:userDetails.userImageURL]]];
//        
//        //this will set the image when loading is finished
//        dispatch_async(dispatch_get_main_queue(), ^{
//            cell.imageView.image = img;
//        });
//    });

    
    
    
    
//    [self.operationQueue addOperationWithBlock:^
//    {
//        UIImage * img = [UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString:userDetails.userImageURL]]];
//        cell.customImageView.image = img;
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^
//         {
//             [_tableViewUsername reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
//         }];
//    }];
    
    
//    __block UIImage *image = [[UIImage alloc] init ];
//    
//    
//    
//    if ([object valueForKey:@"status"])
//    {
//        if([[object valueForKey:@"status"]isEqualToString:@"completed"] && [object valueForKey: @"image"]  && [[object valueForKey: @"image"] isKindOfClass:[UIImage class]])
//        {
//            cell.customImageView.contentMode = UIViewContentModeScaleToFill;
//            cell.customImageView.image = image;
//            cell.accessoryType = UITableViewCellAccessoryCheckmark;
//        }
//    }
//    else
//    {
//        [object setValue:@"inprogress" forKey:@"status"];
//        [self.operationQueue addOperationWithBlock:^
//        {
//            //UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[object valueForKey:@"url"]]]];
//            
//            image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:userDetails.userImageURL]]];
//
//            [object setValue:image forKey:@"image"];
//            [object setValue:@"completed" forKey:@"status"];
//            //count set
//            [[NSOperationQueue mainQueue] addOperationWithBlock:^
//            {
//            [_tableViewUsername reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
//            }];
//        }];
//        
//    }
    return cell;
}
- (IBAction)btnLoadMore:(id)sender
{
    [_objUserDetailsManager generateUserDetails];
    [self.tableViewUsername reloadData];
}
@end

