//
//  FirstViewController.m
//  Oska2
//
//  Created by Neru on 15/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

/////////////////////////////////////////////////////////////////////////////////
- (id)init
{
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"Item List", nil);
        
        [[self tabBarItem] setFinishedSelectedImage:[UIImage imageNamed:(@"fruits_little")] withFinishedUnselectedImage:[UIImage imageNamed:(@"fruits_little")]];
    }
    return self;    
}
/////////////////////////////////////////////////////////////////////////////////

#pragma mark - View lifecycle

/////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //UIBarButtonItem:
    _editBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(editRecord)];
    self.navigationItem.leftBarButtonItem = _editBarButtonItem;
    _addBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addRecord)];
    self.navigationItem.rightBarButtonItem = _addBarButtonItem;
    
    //UIAlertView:
    _addRecordAlertView = [[UIAlertView alloc] initWithTitle:@"Add Record" message:@"Please add your data" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add to fruits",@"Add to vegetables", nil];
    [_addRecordAlertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    //    _chooseRecordDestinationAlertView = [[UIAlertView alloc] initWithTitle:@"Destination" message:@"Where you want to put this data?" delegate:self cancelButtonTitle:@"Fruits" otherButtonTitles:@"Vegetables", nil];
    
    //UITextField in AlertView
    _addRecordTextField = [_addRecordAlertView textFieldAtIndex:0];
    _addRecordTextField.keyboardType = UIKeyboardTypeDefault;
    
    _setAnimation = [[NSIndexSet alloc] init];
    
    //UITableView:
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [self.view addSubview:_tableView];
    
    _headerView = [[Header alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 0.0f, 50.0f)];
    _tableView.tableHeaderView = _headerView;
    
    //    newDateString = [self getTime];
    newDateString = [NSDateFormatter localizedStringFromDate:[NSDate date]
                                                   dateStyle:NSDateFormatterNoStyle
                                                   timeStyle:NSDateFormatterShortStyle];
    
    dataOfFruitsTableArray = [[NSMutableArray alloc] initWithObjects:@"apple", @"banana", @"pineapple", @"strawberry", @"watermelon", nil];
    dataOfVegetablesTableArray = [[NSMutableArray alloc] initWithObjects:@"carrot", @"tomato", @"cucumber", nil];
    ImagesOfFruitArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"apple"],
                                                                 [UIImage imageNamed:@"banana"],
                                                                 [UIImage imageNamed:@"pineapple"],
                                                                 [UIImage imageNamed:@"strawberry"],
                                                                 [UIImage imageNamed:@"watermelon"],
                                                                 nil];
    
    ImagesOfVegetablesArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"carrot"],
                                                                      [UIImage imageNamed:@"tomato"],
                                                                      [UIImage imageNamed:@"cucumber"],
                                                                      nil];
}

/////////////////////////////////////////////////////////////////////////////////
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];    
    [_tableView reloadData];
    [self showTabBar:self.tabBarController];
}

/////////////////////////////////////////////////////////////////////////////////
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    SectionHeader *sectionHeader;
    
    [_tableView setFrame:self.view.frame];
    [sectionHeader setFrame:CGRectMake(0.0f,
                                       0.0f,
                                       CGRectGetWidth(_tableView.frame),
                                       40.0f)];
}
/////////////////////////////////////////////////////////////////////////////////

#pragma mark - UINavigationItem

/////////////////////////////////////////////////////////////////////////////////
-(void)editRecord
{
    if (_editBarButtonItem.tag == 0)
    {
        _editBarButtonItem.title = NSLocalizedString(@"Done", nil);
        [self.tableView setEditing:YES animated:YES];
        _editBarButtonItem.tag =1;
    }
    else if (_editBarButtonItem.tag == 1)
    {
        _editBarButtonItem.title = NSLocalizedString(@"Edit", nil);
        [self.tableView setEditing:NO animated:YES];
        _editBarButtonItem.tag = 0;
        [self.tableView reloadSections:_setAnimation withRowAnimation:UITableViewRowAnimationFade];
        
    }
    [_chooseRecordDestinationAlertView show];
}

/////////////////////////////////////////////////////////////////////////////////
-(void)addRecord
{
    AddItemViewController *addItemViewController = [[AddItemViewController alloc] init];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDuration:0.75];
    [self.navigationController pushViewController:addItemViewController animated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
    
    [self hideTabBar:self.tabBarController];

//    [_addRecordAlertView show];
}

/////////////////////////////////////////////////////////////////////////////////

#pragma mark - UITabBarController

/////////////////////////////////////////////////////////////////////////////////
- (void) hideTabBar:(UITabBarController *) tabbarcontroller 
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    float fHeight = screenRect.size.height;
    if (UIDeviceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation))
    {
        fHeight = screenRect.size.width;
    }
    
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, fHeight, view.frame.size.width, view.frame.size.height)];
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, fHeight)];
            view.backgroundColor = [UIColor blackColor];
        }
    }
    [UIView commitAnimations];
}

/////////////////////////////////////////////////////////////////////////////////
- (void) showTabBar:(UITabBarController *) tabbarcontroller
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    float fHeight = screenRect.size.height - 49.0;
    
    if (UIDeviceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation))
    {
        fHeight = screenRect.size.width - 49.0;
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, fHeight, view.frame.size.width, view.frame.size.height)];
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, fHeight)];
        }
    }
    [UIView commitAnimations];
}

/////////////////////////////////////////////////////////////////////////////////
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    textFieldOutputString = _addRecordTextField.text;
    
    if (buttonIndex == 1)
    {
        [dataOfFruitsTableArray addObject:textFieldOutputString];
        [ImagesOfFruitArray addObject:[UIImage imageNamed:@"noimage"]];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation: UITableViewRowAnimationFade];
    }
    else if (buttonIndex == 2)
    {
        [dataOfVegetablesTableArray addObject:textFieldOutputString];
        [ImagesOfVegetablesArray addObject:[UIImage imageNamed:@"noimage"]];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation: UITableViewRowAnimationFade];
    }
}

/////////////////////////////////////////////////////////////////////////////////

#pragma mark - UITableView DataSource & Delegate

/////////////////////////////////////////////////////////////////////////////////
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    newDateString = [NSDateFormatter localizedStringFromDate:[NSDate date]
                                                   dateStyle:NSDateFormatterNoStyle
                                                   timeStyle:NSDateFormatterShortStyle];;
    switch (indexPath.section)
    {
        case 0:
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
            break;
        case 1:
            break;
        default:
            break;
    }
}

/////////////////////////////////////////////////////////////////////////////////
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"You clicked me! Section:%d, row:%d", indexPath.section, indexPath.row);

    FirstDetailViewController *firstDetailViewController = [[FirstDetailViewController alloc] init];
    [self.navigationController pushViewController:firstDetailViewController animated:YES];
}

/////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

/////////////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [dataOfFruitsTableArray count];
        case 1:
            return [dataOfVegetablesTableArray count];
        default:
            return 1;
    }
}

/////////////////////////////////////////////////////////////////////////////////
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    O2Cell *cell;
    switch (indexPath.section) {
        case 0: {
            static NSString *cellIdentifier1 = @"Cell1";
            cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier1];
            if (cell == nil) {
                cell = [[O2Cell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier1];
            }
            cell.mainLabel.text = [dataOfFruitsTableArray objectAtIndex:indexPath.row];
            cell.detailLabel.text = newDateString;
            cell.o2ImageView.image = [ImagesOfFruitArray objectAtIndex:indexPath.row];
//            [dataOfTableViewCellPicturesArray addObject:[UIImage imageNamed:@"ble"]];
            break;
        }
        default: {
            static NSString *cellIdentifier2 = @"Cell2";
            cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
            if (cell == nil) {
                cell = [[O2Cell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier2];
            }
            cell.mainLabel.text = [dataOfVegetablesTableArray objectAtIndex:indexPath.row];
            cell.detailLabel.text = newDateString;
            cell.o2ImageView.image = [ImagesOfVegetablesArray objectAtIndex:indexPath.row];
//            cell.o2ImageView.image = [dataOfTableViewCellPicturesArray objectAtIndex:indexPath.row];
            break;
        }
    }

    return cell;
}

/////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

/////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25.0f;
}

/////////////////////////////////////////////////////////////////////////////////
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{   
//    switch (section) {
//        case 0:
//            return NSLocalizedString(@"Fruits", nil);
//        case 1:
//            return NSLocalizedString(@"Vegetables", nil);
//        default:
//            return @"";
//    }
//}

/////////////////////////////////////////////////////////////////////////////////
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SectionHeader *sectionHeader;   
    sectionHeader = [[SectionHeader alloc] init];
        
    switch (section)
    {
        case 0:
            [sectionHeader.sectionHeaderLabel setText: NSLocalizedString(@"Fruits", nil)];
            break;
        default:
            [sectionHeader.sectionHeaderLabel setText: NSLocalizedString(@"Vegetables", nil)];
            break;
    }
    return sectionHeader;
}

/////////////////////////////////////////////////////////////////////////////////
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

/////////////////////////////////////////////////////////////////////////////////
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    switch (sourceIndexPath.section)
    {
        case 0:
            [dataOfFruitsTableArray exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
            break;
        case 1:
            [dataOfVegetablesTableArray exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
            break;
        default:
            break;
    }
}

/////////////////////////////////////////////////////////////////////////////////
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
        switch (indexPath.section)
        {
            case 0:
                [dataOfFruitsTableArray removeObjectAtIndex:indexPath.row];
                [ImagesOfFruitArray removeObjectAtIndex:indexPath.row];
                [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
                break;
            case 1:
                [dataOfVegetablesTableArray removeObjectAtIndex:indexPath.row];
                [ImagesOfVegetablesArray removeObjectAtIndex:indexPath.row];
                [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
                break;
            default:
                break;
        }
    [self.tableView reloadSections:_setAnimation withRowAnimation:UITableViewRowAnimationFade];
}

/////////////////////////////////////////////////////////////////////////////////

@end
