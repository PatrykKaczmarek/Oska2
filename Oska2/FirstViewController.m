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
    
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 0.0f, 50.0f)];
    [_headerView setBackgroundColor:[UIColor cyanColor]];
    
    _headerLabel = [[UILabel alloc] init];
    [_headerLabel setText:@"Your storehouse"];
    [_headerLabel setBackgroundColor:[UIColor whiteColor]];
    [_headerLabel setTextAlignment:NSTextAlignmentCenter];
    [_headerView addSubview:_headerLabel];
    
    _tableView.tableHeaderView = _headerView;
    
//    newDateString = [self getTime];
    newDateString = [NSDateFormatter localizedStringFromDate:[NSDate date]
                                                   dateStyle:NSDateFormatterNoStyle
                                                   timeStyle:NSDateFormatterShortStyle];
    
    dataOfFruitsTableArray = [[NSMutableArray alloc] initWithObjects:@"apple", @"banana", @"pineapple", @"strawberry", @"watermelon", nil];
    dataOfVegetablesTableArray = [[NSMutableArray alloc] initWithObjects:@"carrot", @"tomato", @"cucumber", nil];
    dataOfTableViewCellPicturesArray = [[NSMutableArray alloc] initWithObjects:
                                        [UIImage imageNamed:@"apple"],
                                        [UIImage imageNamed:@"banana"],
                                        [UIImage imageNamed:@"pineapple"],
                                        [UIImage imageNamed:@"strawberry"],
                                        [UIImage imageNamed:@"watermelon"],
                                        nil];
}

/////////////////////////////////////////////////////////////////////////////////
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_tableView reloadData];
}

/////////////////////////////////////////////////////////////////////////////////
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [_headerLabel setFrame:CGRectMake(10.0f,
                                      10.0f,
                                      CGRectGetWidth(_tableView.frame) - 20.0f,
                                      CGRectGetHeight(_headerView.frame) - 20.0f)];
    
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
        [dataOfTableViewCellPicturesArray addObject:[UIImage imageNamed:@"apple"]];
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"You clicked me! Section:%d, row:%d", indexPath.section, indexPath.row);

    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondViewController animated:YES];
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
            cell.o2ImageView.image = [dataOfTableViewCellPicturesArray objectAtIndex:indexPath.row];
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
                [dataOfTableViewCellPicturesArray removeObjectAtIndex:indexPath.row];
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
