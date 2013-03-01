//
//  AddItemViewController.m
//  Oska2
//
//  Created by Neru on 25/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@end

// ================================================================================
@implementation AddItemViewController

- (id)init
{
    self = [super init];
    if (self) 
    {
        [self setTitle:(NSLocalizedString(@"New Item", nil))];
        [self.view setBackgroundColor:[UIColor yellowColor]];
    }
    return self;
}

// ================================================================================

#pragma mark - View lifecycle

// ================================================================================
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _textFieldMutableArray = [[NSMutableArray alloc] init];
 
//    UIButton *customButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [customButton setBackgroundColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0]];
//    [customButton setTitle:@"DONE" forState:UIControlStateNormal];
//    
//    UIBarButtonItem *customRightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customButton];
//    self.navigationItem.rightBarButtonItem = customRightButtonItem;

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                      target:self
                                                                      action:@selector(saveRecord)];
   
    _addTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [_addTableView setDelegate:self];
    [_addTableView setDataSource:self];
    _addTableView.scrollEnabled = NO;
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectZero];
    backView.backgroundColor = [UIColor clearColor];
    _addTableView.backgroundView = backView;
    [self.view addSubview:_addTableView];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(AddImageBackgroundLabelDidTouch:)];
    
    _addImageBackgroundLabel = [[UILabel alloc] init];
    [_addImageBackgroundLabel setBackgroundColor:[UIColor brownColor]];
    [_addImageBackgroundLabel addGestureRecognizer:tapGestureRecognizer];
    [_addImageBackgroundLabel setUserInteractionEnabled:YES];
    [self.view addSubview:_addImageBackgroundLabel];
    
    _addImageForegroundLabel = [[UILabel alloc] init];
    [_addImageForegroundLabel setBackgroundColor:[UIColor yellowColor]];
    [_addImageForegroundLabel setText:NSLocalizedString(@"Add \n image", nil)];
    [_addImageForegroundLabel setNumberOfLines:2];
    [_addImageForegroundLabel setTextColor:[UIColor brownColor]];
    [_addImageForegroundLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:_addImageForegroundLabel];
    
//    [_addImageButton setTitleColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0] forState:UIControlStateNormal];
//    [self.view addSubview:_addImageButton];
    
}

// --------------------------------------------------------------------------------
-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGFloat margin = 10.0f;
    CGSize addImageBackgroundLabelSize = CGSizeMake(70.0f, 70.0f);
    
    [_addImageBackgroundLabel setFrame:CGRectMake(margin,
                                                  margin,
                                                  addImageBackgroundLabelSize.width,
                                                  addImageBackgroundLabelSize.height)];
    
    [_addImageForegroundLabel setFrame:CGRectMake(1.2*margin,
                                                  1.2*margin,
                                                  addImageBackgroundLabelSize.width - 0.4*margin,
                                                  addImageBackgroundLabelSize.height - 0.4*margin)];
    
    
    [_addTableView setFrame:CGRectMake(CGRectGetMaxX(_addImageBackgroundLabel.frame) + margin,
                                   CGRectGetMinY(_addImageBackgroundLabel.frame) - 10.0f,
                                   CGRectGetMaxX(self.view.frame) - CGRectGetMaxX(_addImageBackgroundLabel.frame) - 2*margin,
                                   225.0f)];
}

// --------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// ================================================================================

#pragma mark - 

// ================================================================================
-(void)saveRecord
{
    FirstViewController *firstViewController = [[FirstViewController alloc] init];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDuration:0.75];
    [self.navigationController pushViewController:firstViewController animated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
}

// ================================================================================

#pragma mark - UITableView DataSource & Delegate

// ================================================================================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

// --------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 1;
            break;
        default:
            return 3;
            break;
    }
}

// --------------------------------------------------------------------------------
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

// --------------------------------------------------------------------------------
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    TextCell *textCell;
    AmountCell *amountCell;
    PriceCell *priceCell;
    static NSString *cellIdentifier1 = @"Cell1";
    static NSString *cellIdentifier2 = @"Cell2";
    static NSString *cellIdentifier3 = @"Cell3";
    
    if ((indexPath.section == 1) && (indexPath.row == 0))
    {
        if (cell == nil)
        {
            amountCell = [[AmountCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier1];
        }
        [amountCell.textField setDelegate:self];
        [_textFieldMutableArray insertObject:(amountCell.textField) atIndex:1];
        return amountCell;
    }
    else if ((indexPath.section == 1) && (indexPath.row == 1))
    {
        if (cell == nil)
        {
            priceCell = [[PriceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier2];
        }
        [priceCell.textField setDelegate:self];
        [_textFieldMutableArray insertObject:(priceCell.textField) atIndex:2];
        return priceCell;
        
    }
    else
    {
        if (cell == nil)
        {
            textCell = [[TextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier3];
            switch (indexPath.section)
            {
                case 0:
                    [textCell.textField setPlaceholder:NSLocalizedString(@"Enter name here", nil)];
                    [textCell.textField becomeFirstResponder];
                    [_textFieldMutableArray insertObject:(textCell.textField) atIndex:0];
                    break;
                case 1:
                    if (indexPath.row == 2)
                    {
                        [textCell.textField setPlaceholder:NSLocalizedString(@"Enter description here", nil)];
                        [_textFieldMutableArray insertObject:(textCell.textField) atIndex:3];
                        break;
                    }
                default:
                    break;
            }
        }
        [textCell.textField setDelegate:self];
        [self.enhancedKeyboard.nextButton setEnabled:YES];
        [self.enhancedKeyboard.previousButton setEnabled:NO];
        return textCell;
    }
}

// ================================================================================

#pragma mark - UITextField delegate

// ================================================================================
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.enhancedKeyboard = [[EnhancedKeyboard alloc] init];
    self.enhancedKeyboard.delegate = self;
    [textField setInputAccessoryView:[self.enhancedKeyboard prevEnabled:YES nextEnabled:YES]];
    
    if ([[_textFieldMutableArray objectAtIndex:0] isEditing])
    {
        [self.enhancedKeyboard.previousButton setEnabled:NO];
        [self.enhancedKeyboard.nextButton setEnabled:YES];
    }
    if ([[_textFieldMutableArray objectAtIndex:[_textFieldMutableArray count] -1] isEditing])
    {
        [self.enhancedKeyboard.previousButton setEnabled:YES];
        [self.enhancedKeyboard.nextButton setEnabled:NO];
    }
}

// --------------------------------------------------------------------------------/
-(void)nextDidTouchUpInside
{
    int i;

    for (i=0; i<[_textFieldMutableArray count]; i++)
    {
        if ([[_textFieldMutableArray objectAtIndex:i] isEditing] && (i!=[_textFieldMutableArray count] -1))
        {
            [[_textFieldMutableArray objectAtIndex:i+1]  becomeFirstResponder];
            break;
        }
    }
}

// --------------------------------------------------------------------------------
-(void)prevDidTouchUpInside
{
    int i;

    for (i=0; i<[_textFieldMutableArray count]; i++)
    {
        if ([[_textFieldMutableArray objectAtIndex:i] isEditing] && (i!=0))
        {
            [[_textFieldMutableArray objectAtIndex:i-1]  becomeFirstResponder];
            break;
        }
    }
}

// ================================================================================

#pragma mark - ActionSheets - buttons

// ================================================================================
-(void)currencyButtonDidClick
{
    CurrencyPicker *actionSheetCurrencyPicker = [[CurrencyPicker alloc] init];
    [actionSheetCurrencyPicker showInView:self.view];
}

// --------------------------------------------------------------------------------
-(void)AddImageBackgroundLabelDidTouch:(id)sender
{
    AddImage *actionSheetAddImage = [[AddImage alloc] init];
    [actionSheetAddImage showInView:self.view];
}
@end
