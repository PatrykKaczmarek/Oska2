//
//  FirstViewController.m
//  Oska2
//
//  Created by Neru on 15/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "FirstViewController.h"
#import "DetailViewController.h"
#import "SecondViewController.h"
#import "O2Cell.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

/////////////////////////////////////////////////////////////////////////////////
- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Storehous";
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
    editBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(editRecord)];
    self.navigationItem.leftBarButtonItem = editBarButtonItem;
    addBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addRecord)];
    self.navigationItem.rightBarButtonItem = addBarButtonItem;
        
    //UIAlertView:
    addRecordAlertView = [[UIAlertView alloc] initWithTitle:@"Add Record" message:@"Please add your data" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add to fruits",@"Add to vegetables", nil];
    [addRecordAlertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    addRecordAlertView.tag = 1;
    
    
    //UITextField in AlertView
    addRecordTextField = [addRecordAlertView textFieldAtIndex:0];
    addRecordTextField.keyboardType = UIKeyboardTypeDefault;
    
    setAnimation = [[NSIndexSet alloc] init];
    
    //UITableView:
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
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
    
    newDateString = [NSDateFormatter localizedStringFromDate:[NSDate date]
                                                   dateStyle:NSDateFormatterNoStyle
                                                   timeStyle:NSDateFormatterShortStyle];
    
    listOfCountriesNames = [[NSMutableArray alloc] init];
    
    NSArray *countriesToVisitArray = [[NSArray alloc] initWithObjects:@"China", @"USA", @"Japan", @"Greece", @"Canada", nil];
    NSDictionary *countriesToVisitDictionary = [NSDictionary dictionaryWithObject:countriesToVisitArray forKey:@"Countries"];
    
    NSArray *countriesVisitedArray = [[NSArray alloc] initWithObjects:@"Germany", @"Poland", @"Finland", @"Czech Republic", nil];
    NSDictionary *countriesVisitedDictionary = [NSDictionary dictionaryWithObject:countriesVisitedArray forKey:@"Countries"];
    
//    NSArray *dataOfVegetablesTableArray = [[NSArray alloc] initWithObjects:@"carrot", @"tomato", @"cucumber", nil];
//    dataOfTableViewCellPicturesArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"apple"], [UIImage imageNamed:@"banana"], [UIImage imageNamed:@"pineapple"], [UIImage imageNamed:@"strawberry"], [UIImage imageNamed:@"watermelon"], nil];
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
//    if (editBarButtonItem.tag == 0)
//    {
//        editBarButtonItem.title = @"Done";
//        [self.tableView setEditing:YES animated:YES];
//        editBarButtonItem.tag =1;
//    }
//    else if (editBarButtonItem.tag == 1)
//    {
//        editBarButtonItem.title = @"Edit";
//        [self.tableView setEditing:NO animated:YES];
//        editBarButtonItem.tag = 0;
//        [self.tableView reloadSections:setAnimation withRowAnimation:UITableViewRowAnimationFade];
//        
//    }
//    [chooseRecordDestinationAlertView show];
    
}

/////////////////////////////////////////////////////////////////////////////////
-(void)addRecord
{
//    [addRecordAlertView show];
}

/////////////////////////////////////////////////////////////////////////////////
//-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
//{
//    textFieldOutputString = addRecordTextField.text;
//    
//    if (buttonIndex == 1)
//    {
//        [dataOfFruitsTableArray addObject:textFieldOutputString];
//        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation: UITableViewRowAnimationFade];
//    }
//    else if (buttonIndex == 2)
//    {
//        [dataOfVegetablesTableArray addObject:textFieldOutputString];
//        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation: UITableViewRowAnimationFade];
//    }
//}

/////////////////////////////////////////////////////////////////////////////////

#pragma mark - UITableView DataSource & Delegate

/////////////////////////////////////////////////////////////////////////////////
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
//    newDateString = [NSDateFormatter localizedStringFromDate:[NSDate date]
//                                                   dateStyle:NSDateFormatterNoStyle
//                                                   timeStyle:NSDateFormatterShortStyle];;
//    switch (indexPath.section)
//    {
//        case 0:
//            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
//            break;
//        case 1:
//            break;
//        default:
//            break;
//    }
    [self tableView:tableView didSelectRowAtIndexPath:indexPath];
}

/////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    return 2;
}

/////////////////////////////////////////////////////////////////////////////////
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    switch (section) {
//        case 0:
//            return [dataOfFruitsTableArray count];
//        case 1:
//            return [dataOfVegetablesTableArray count];
//        default:
//            return 1;
//    }
//}

/////////////////////////////////////////////////////////////////////////////////
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"O2Cell";
    O2Cell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[O2Cell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
//        cell.backgroundColor = [UIColor redColor];
    }
    
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
    
//    NSString *selectedCountry = [listOfCountriesNames objectAtIndex:indexPath.row];
//    DetailViewController *detailViewController = [[DetailViewController alloc] init];
//    detailViewController.selectedCountryString = selectedCountry;
//    self.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:detailViewController animated:YES];
}

/////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}

/////////////////////////////////////////////////////////////////////////////////
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
//    switch (section) {
//        case 0:
//            return @"Fruits";
//        case 1:
//            return @"Vegetables";
//        default:
//            return @"";
//    }
}

/////////////////////////////////////////////////////////////////////////////////
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

/////////////////////////////////////////////////////////////////////////////////
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
//    switch (sourceIndexPath.section)
//    {
//        case 0:
//            [dataOfFruitsTableArray exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
//            break;
//        case 1:
//            [dataOfVegetablesTableArray exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
//            break;
//        default:
//            break;
//    }
}

/////////////////////////////////////////////////////////////////////////////////
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (editingStyle == UITableViewCellEditingStyleDelete)
//        switch (indexPath.section)
//        {
//            case 0:
//                [dataOfFruitsTableArray removeObjectAtIndex:indexPath.row];
//                [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
//                break;
//            case 1:
//                [dataOfVegetablesTableArray removeObjectAtIndex:indexPath.row];
//                [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
//                break;
//            default:
//                break;
//        }
//    [self.tableView reloadSections:setAnimation withRowAnimation:UITableViewRowAnimationFade];
}

/////////////////////////////////////////////////////////////////////////////////


@end
