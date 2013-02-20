//
//  FirstViewController.m
//  Oska2
//
//  Created by Neru on 15/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

/////////////////////////////////////////////////////////////////////////////////
- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Owoce";
    }
    return self;    
}


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
    _addRecordAlertView.tag = 1;
    
//    _chooseRecordDestinationAlertView = [[UIAlertView alloc] initWithTitle:@"Destination" message:@"Where you want to put this data?" delegate:self cancelButtonTitle:@"Fruits" otherButtonTitles:@"Vegetables", nil];
//    _chooseRecordDestinationAlertView.tag = 2;
    
    //UITextField in AlertView
    _addRecordTextField = [_addRecordAlertView textFieldAtIndex:0];
    _addRecordTextField.keyboardType = UIKeyboardTypeDefault;
    
    _setAnimation = [[NSIndexSet alloc] init];
    
    //UITableView:
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [self.view addSubview:_tableView];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 0.0f, 50.0f)];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 10.0f, CGRectGetWidth(_tableView.frame) - 20.0f, CGRectGetHeight(headerView.frame) - 20.0f)];
    [headerLabel setText:@"OUR STOREHOUSE"];
    [headerLabel setBackgroundColor:[UIColor clearColor]];
    [headerLabel setTextAlignment:NSTextAlignmentCenter];
    [headerView addSubview:headerLabel];
    [headerView setBackgroundColor:[UIColor cyanColor]];
    _tableView.tableHeaderView = headerView;
    
//    newDateString = [self getTime];
    newDateString = [NSDateFormatter localizedStringFromDate:[NSDate date]
                                                   dateStyle:NSDateFormatterNoStyle
                                                   timeStyle:NSDateFormatterShortStyle];
    
    dataOfFruitsTableArray = [[NSMutableArray alloc] initWithObjects:@"apple", @"banana", @"pineapple", @"strawberry", @"watermelon", nil];
    dataOfVegetablesTableArray = [[NSMutableArray alloc] initWithObjects:@"carrot", @"tomato", @"cucumber", nil];
    dataOfTableViewCellPicturesArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"apple"], [UIImage imageNamed:@"banana"], [UIImage imageNamed:@"pineapple"], [UIImage imageNamed:@"strawberry"], [UIImage imageNamed:@"watermelon"], nil];
}

/////////////////////////////////////////////////////////////////////////////////
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [_tableView setFrame:self.view.frame];
}
/////////////////////////////////////////////////////////////////////////////////

#pragma mark - UINavigationItem

/////////////////////////////////////////////////////////////////////////////////
-(void)editRecord
{
    if (_editBarButtonItem.tag == 0)
    {
        _editBarButtonItem.title = @"Done";
        [self.tableView setEditing:YES animated:YES];
        _editBarButtonItem.tag =1;
    }
    else if (_editBarButtonItem.tag == 1)
    {
        _editBarButtonItem.title = @"Edit";
        [self.tableView setEditing:NO animated:YES];
        _editBarButtonItem.tag = 0;
        [self.tableView reloadSections:_setAnimation withRowAnimation:UITableViewRowAnimationFade];
        
    }
    [_chooseRecordDestinationAlertView show];
    
}

/////////////////////////////////////////////////////////////////////////////////
-(void)addRecord
{
    [_addRecordAlertView show];
}

/////////////////////////////////////////////////////////////////////////////////
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    textFieldOutputString = _addRecordTextField.text;
    
    if (buttonIndex == 1)
    {
        [dataOfFruitsTableArray addObject:textFieldOutputString];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation: UITableViewRowAnimationFade];
    }
    else if (buttonIndex == 2)
    {
        [dataOfVegetablesTableArray addObject:textFieldOutputString];
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
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    UILabel *myOwnCellMainLabel;
    UIImageView *myOwnCellLeftImageView;
    UIImageView *myOwnCellRightImageView;
       
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
        cell.backgroundColor = [UIColor yellowColor];
        
        myOwnCellMainLabel = [[UILabel alloc] initWithFrame:CGRectMake(30.0f ,5.0f, CGRectGetWidth(tableView.frame)-30.0f, 15.0f)];
        myOwnCellMainLabel.backgroundColor = [UIColor clearColor];
        myOwnCellMainLabel.textColor = [UIColor blueColor];
        myOwnCellMainLabel.textAlignment = NSTextAlignmentLeft;
        myOwnCellMainLabel.font = [UIFont systemFontOfSize:15.0f];
        myOwnCellMainLabel.tag = 101;
        
        _myOwnCellDetailLabel = [[UILabel alloc] initWithFrame:CGRectMake(100.0f ,22.5f, CGRectGetWidth(tableView.frame)-30.0f, 10.0f)];
        _myOwnCellDetailLabel.backgroundColor = [UIColor clearColor];
        _myOwnCellDetailLabel.textColor = [UIColor brownColor];
        _myOwnCellDetailLabel.textAlignment = NSTextAlignmentLeft;
        _myOwnCellDetailLabel.font = [UIFont systemFontOfSize:10.0f];
        _myOwnCellDetailLabel.tag = 102;
        
        myOwnCellLeftImageView = [[UIImageView alloc] initWithFrame: CGRectMake(10.0f ,7.5f, 12.0f, 12.0f)];
        myOwnCellLeftImageView.image = [UIImage imageNamed:@"black rectangle"];
        myOwnCellLeftImageView.tag = 103;
        
        myOwnCellRightImageView = [[UIImageView alloc] initWithFrame: CGRectMake(200.0f ,5.0f, 32.0f, 32.0f)];
        myOwnCellRightImageView.tag = 104;
        
        [cell.contentView addSubview:myOwnCellMainLabel];
        [cell.contentView addSubview:_myOwnCellDetailLabel];
        [cell.contentView addSubview:myOwnCellLeftImageView];
        [cell.contentView addSubview:myOwnCellRightImageView];
    }
    
    myOwnCellMainLabel = (UILabel *)[cell.contentView viewWithTag:101];
    _myOwnCellDetailLabel = (UILabel *)[cell.contentView viewWithTag:102];
    myOwnCellLeftImageView = (UIImageView *)[cell.contentView viewWithTag:103];
    myOwnCellRightImageView = (UIImageView *)[cell.contentView viewWithTag:104];
   
    
    switch (indexPath.section)
    {
        case 0:
            myOwnCellMainLabel.text = [dataOfFruitsTableArray objectAtIndex:indexPath.row];
            _myOwnCellDetailLabel.text = newDateString;
            myOwnCellRightImageView.image = [dataOfTableViewCellPicturesArray objectAtIndex:indexPath.row];
            break;
        case 1:
            cell.textLabel.text = [dataOfVegetablesTableArray objectAtIndex:indexPath.row];
            cell.detailTextLabel.text = [dataOfVegetablesTableArray objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    
        cell.showsReorderControl = YES;
    
    return cell;
}

/////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

/////////////////////////////////////////////////////////////////////////////////
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"You clicked me! Section:%d, row:%d", indexPath.section, indexPath.row);
    
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondViewController animated:YES];
}

/////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}

/////////////////////////////////////////////////////////////////////////////////
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Fruits";
        case 1:
            return @"Vegetables";
        default:
            return @"";
    }
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
                [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
                break;
            case 1:
                [dataOfVegetablesTableArray removeObjectAtIndex:indexPath.row];
                [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
                break;
            default:
                break;
        }
    [self.tableView reloadSections:_setAnimation withRowAnimation:UITableViewRowAnimationFade];
}

/////////////////////////////////////////////////////////////////////////////////


@end
