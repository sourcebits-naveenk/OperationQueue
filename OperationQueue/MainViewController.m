//
//  ViewController.m
//  OperationQueue
//
//  Created by Naveen Katari on 16/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "MainViewController.h"
#import "UserDetails.h"
#import "UIImageView+WebCache.h"


@interface ViewController ()
{
    
    NSMutableArray *arrUserDetails;
}

@property (nonatomic,strong) NSOperationQueue *operationQueue;

@end  

@implementation ViewController
int from = 1;
int to = 10;
- (void)viewDidLoad
{
    [super viewDidLoad];
  
   //Initializing modal class objects and calling the methods from those classes
    arrUserDetails = [[NSMutableArray alloc]init];
//    _objUserDetailsManager = [[UserDetailsManager alloc]init];
//    [_objUserDetailsManager generateUserDetails];
     //Registering Nib of TableViewCell
    [_tableViewUsername registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"CustomCell"];
    self.operationQueue = [[ NSOperationQueue alloc] init ];
    
    _tableViewUsername.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self generateUserDetails];
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
    
    return [ arrUserDetails count ];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //_tableViewCell = [[TableViewCell alloc]init];
    UserDetails *userDetails = [arrUserDetails objectAtIndex:indexPath.row];
    static NSString *CellIdentifier = @"CustomCell";
    TableViewCell *cell = (TableViewCell *)[_tableViewUsername dequeueReusableCellWithIdentifier:CellIdentifier];

    cell.userName.text = userDetails.userName;
    [cell.customImageView sd_setImageWithURL:[NSURL URLWithString:userDetails.userImageURL] placeholderImage:nil options:SDWebImageCacheMemoryOnly completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL){
        if(image)
        {
            cell.customImageView.image = image;
            cell.customImageView.contentMode = UIViewContentModeScaleToFill;
            cell.accessoryType = UITableViewCellAccessoryCheckmark;

        }
        
        
    }];
     return cell;
     
     
        // Add an operation as a block to a queue
    
//    //--------------
//       [self.operationQueue addOperationWithBlock: ^ {
//        
//        NSURL *aURL = [NSURL URLWithString:userDetails.userImageURL];
//        NSError *error = nil;
//        NSData *data = [NSData dataWithContentsOfURL:aURL options:nil error:&error];
//        UIImage *image = nil;
//    
//        if (data)
//        {
//            image = [UIImage imageWithData:data];
//            
//            // Update UI on the main thread.
//            [[NSOperationQueue mainQueue] addOperationWithBlock: ^ {
//                cell.customImageView.image = image;
//                cell.customImageView.contentMode = UIViewContentModeScaleToFill;
//                cell.accessoryType = UITableViewCellAccessoryCheckmark;
//            }];
//        }
//    }];
//    //---------------
    
    
    
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
    
}
- (IBAction)btnLoadMore:(id)sender
{
    [self generateUserDetails];
    [self.tableViewUsername reloadData];
}

-(void) generateUserDetails
{
        if(to <= 100)
        {
            for(int i = from; i <= to; i++ )
            {
                _userDetail = [[UserDetails alloc]init];
                _userDetail.userName = [ NSString stringWithFormat:@"User%d", i];
                _userDetail.userImageURL = [NSString stringWithFormat:@"http://www.robots.ox.ac.uk/~vgg/research/flowers_demo/images/flower_%d.jpg", (i% 10) + 1];
                //Adding Userdetails objects to array
                [arrUserDetails addObject:_userDetail];
            }
            
            from = from + 10;
            to = to + 10;
            
        }

}
@end



