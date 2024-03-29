//
//  RevealMenuScreen.m
//  Dream_iOS
//
//  Created by Ma Sunghoon on 2014. 1. 14..
//  Copyright (c) 2014년 Ma Sunghoon. All rights reserved.
//

#import "RevealMenuScreen.h"
#import "API.h"
#import "UIAlertView+error.h"
#import "InitScreen.h"


@interface RevealMenuScreen ()

@property (nonatomic, strong) NSArray *menuItems;

@end

@implementation SWUITableViewCell

@end



@implementation RevealMenuScreen

@synthesize logoutCell;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor colorWithWhite:0.2f alpha:1.0f]];
    [self.tableView setBackgroundColor:[UIColor colorWithWhite:0.2f alpha:1.0f]];
    [self.tableView setSeparatorColor:[UIColor colorWithWhite:0.15f alpha:0.2f]];

    _menuItems = @[@"Profile", @"Info", @"Settings", @"Notice", @"Update", @"Logout"];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSString *CellIdentifier = [self.menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    [cell setBackgroundColor:[UIColor colorWithWhite:0.2f alpha:1.0f]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat size;
    switch (indexPath.row){
        case 0:
            size = 220;
            break;
        case 1:
            size = 120;
            break;
        default:
            size = 44;
            break;
    }

    return size;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    // configure the segue.
//    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] )
//    {
//        SWRevealViewControllerSegue* rvcs = (SWRevealViewControllerSegue*) segue;
//
//        SWRevealViewController* rvc = self.revealViewController;
//        NSAssert( rvc != nil, @"oops! must have a revealViewController" );
//
//        NSAssert( [rvc.frontViewController isKindOfClass: [UINavigationController class]], @"oops!  for this segue we want a permanent navigation controller in the front!" );
//
//        rvcs.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc)
//        {
//            UINavigationController* nc = [[UINavigationController alloc] initWithRootViewController:dvc];
//            [rvc setFrontViewController:nc animated:YES];
//
//
        }

- (IBAction)cellLogoutTapped:(id)sender {
    [[API sharedInstance] logout];

    InitScreen *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DreamProjInit"];
    [self presentViewController:viewController animated:YES completion:nil];
}



@end
