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
        [self setTitle:(NSLocalizedString(@"New object", nil))];
    }
    return self;
}

// ================================================================================
#pragma mark - View lifecycle
// ================================================================================
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    _textFieldMutableArray = [[NSMutableArray alloc] init];
    _categoryArray = [[NSMutableArray alloc] initWithObjects:NSLocalizedString(@"Fruits", nil), NSLocalizedString(@"Vegetables", nil), nil];
    
    //will show "cancel" in backBarButtonItem in VC one level up in stack:
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:nil action:nil];
 
    _saveButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Save", nil)
                                                       style:UIBarButtonItemStyleBordered
                                                      target:self
                                                      action:@selector(saveRecord)];
    self.navigationItem.rightBarButtonItem = _saveButtonItem;
    [_saveButtonItem setEnabled:NO];
    
    _imagePickerController = [[UIImagePickerController alloc] init];
    [_imagePickerController setDelegate:self];
   
    _addTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [_addTableView setDelegate:self];
    [_addTableView setDataSource:self];
//    _addTableView.scrollEnabled = NO;
    [_addTableView setBackgroundView:nil];
    [self.view addSubview:_addTableView];
    
    _addImageBackgroundLabel = [[UILabel alloc] init];
    [_addImageBackgroundLabel setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:_addImageBackgroundLabel];
    
    _addImageForegroundLabel = [[UILabel alloc] init];
    [_addImageForegroundLabel setBackgroundColor:[UIColor yellowColor]];
    [_addImageForegroundLabel setText:NSLocalizedString(@"Add \n image", nil)];
    [_addImageForegroundLabel setNumberOfLines:2];
    [_addImageForegroundLabel setTextColor:[UIColor brownColor]];
    [_addImageForegroundLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:_addImageForegroundLabel];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(AddImageImageViewDidTouch:)];
    _addImageImageView = [[UIImageView alloc] init];
    [_addImageImageView addGestureRecognizer:tapGestureRecognizer];
    [_addImageImageView setUserInteractionEnabled:YES];
    [self.view addSubview:_addImageImageView];
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
    
    [_addImageImageView setFrame:CGRectMake(margin,
                                            margin,
                                            addImageBackgroundLabelSize.width,
                                            addImageBackgroundLabelSize.height)];
}

// --------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// ================================================================================
#pragma mark - UINavigationItem actions
// ================================================================================
-(void)saveRecord
{   
    if ([_delegate respondsToSelector:@selector(productName:productAmount:productPrice:productDescription:priceCurrency:productImage:)])
    {
        [_delegate productName:[[_textFieldMutableArray objectAtIndex:0] text]
                 productAmount:[[_textFieldMutableArray objectAtIndex:1] text]
                  productPrice:[[_textFieldMutableArray objectAtIndex:2] text]
            productDescription:[[_textFieldMutableArray objectAtIndex:3] text]
                 priceCurrency:(_currencyDidChoose)
                  productImage:(_addImageImageView.image)];
    }
//    UIView animateWithDuration:<#(NSTimeInterval)#> delay:<#(NSTimeInterval)#> options:<#(UIViewAnimationOptions)#> animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDuration:0.75];
    [self.navigationController popViewControllerAnimated:YES];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
}

// ================================================================================
#pragma mark - UITableView DataSource & Delegate
// ================================================================================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

// --------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 1;
            break;
        case 1:
            return 3;
            break;
        default:
            return 1;
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
    CategoryCell *categoryCell;
    static NSString *cellIdentifier1 = @"Cell1";
    static NSString *cellIdentifier2 = @"Cell2";
    static NSString *cellIdentifier3 = @"Cell3";
    static NSString *cellIdentifier4 = @"Cell4";
    
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
        [priceCell.currencyButton addTarget:self action:@selector(currencyButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        [_textFieldMutableArray insertObject:(priceCell.textField) atIndex:2];
        return priceCell;
        
    }
    else if (indexPath.section == 2)
    {
        if (cell == nil)
        {
            categoryCell = [[CategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier4];
        }
        [categoryCell.textField setDelegate:self];
        [categoryCell.chooseCategoryButton addTarget:self action:@selector(chooseCategoryButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        return categoryCell;
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
                    textCell.textField.tag = 255;
                    [_textFieldMutableArray insertObject:(textCell.textField) atIndex:0];
                    break;
                case 1:
                    if (indexPath.row == 2)
                    {
                        [textCell.textField setPlaceholder:NSLocalizedString(@"Enter description here", nil)];
                        textCell.textField.tag = 0;
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
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField.tag == 255) {
        if (range.location == 0 && string.length > 0) {
            [_saveButtonItem setEnabled:YES];
        } else if (range.location == 0 && (!string || [string isEqualToString:@""])) {
            [_saveButtonItem setEnabled:NO];
        }
    }
    return YES;
}

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

// --------------------------------------------------------------------------------
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (([[[_textFieldMutableArray objectAtIndex:0] text] length] == 0) && ([[_textFieldMutableArray objectAtIndex:0] text] != nil))
    {
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
    }
    else
    {
        [self.navigationItem.rightBarButtonItem setEnabled:YES];
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
#pragma mark - CurrencyPickerDelegate
// ================================================================================
-(void)currencyPickerDidChangeToCurrency:(NSString *)currency
{
    _currencyDidChoose = currency;
    PriceCell *cell = (PriceCell *)[self.addTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
    [cell.currencyButton setTitle:_currencyDidChoose forState:UIControlStateNormal];
}
// ================================================================================
#pragma mark - ActionSheets - buttons
// ================================================================================
-(void)currencyButtonDidClick
{
    PriceCell *cell = (PriceCell *)[self.addTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
    CurrencyPicker *currencyPicker = [[CurrencyPicker alloc] init];
    
    [currencyPicker setCurrencyDelegate:self];
    [currencyPicker scrollToSelectedValue:cell.currencyButton.titleLabel.text];
    [currencyPicker showInView:self.view];
}

// --------------------------------------------------------------------------------
-(void)chooseCategoryButtonDidClick
{
    CategoryPicker *categoryPicker = [[CategoryPicker alloc] init];
    categoryPicker.categoryArray = _categoryArray;
    [categoryPicker showInView:self.view];
}
// --------------------------------------------------------------------------------
-(void)AddImageImageViewDidTouch:(id)sender
{
    if (_addImageImageView.image == nil)
    {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"Choose source", nil)
                                                                 delegate:self
                                                        cancelButtonTitle:NSLocalizedString(@"Cancel", nil)
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:NSLocalizedString(@"Library", nil),
                                      NSLocalizedString(@"Camera", nil),
                                      NSLocalizedString(@"Template", nil), nil];
        [actionSheet showFromTabBar:[self tabBarController].tabBar];
    }
    else
    {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"Choose source", nil)
                                                                 delegate:self
                                                        cancelButtonTitle:NSLocalizedString(@"Cancel", nil)
                                                   destructiveButtonTitle:NSLocalizedString(@"Delete", nil)
                                                        otherButtonTitles:NSLocalizedString(@"Library", nil),
                                      NSLocalizedString(@"Camera", nil),
                                      NSLocalizedString(@"Template", nil), nil];
        [actionSheet showFromTabBar:[self tabBarController].tabBar];
    }
}

// --------------------------------------------------------------------------------
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (_addImageImageView.image == nil)
    {
        switch (buttonIndex)
        {
            case 0: { //Photo Library
                [_imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
                [self presentViewController:_imagePickerController animated:YES completion:NULL];
                break;
            }
            case 1: { //Camera
                [_imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
                [self presentViewController:_imagePickerController animated:YES completion:NULL];
                break;
            }
            case 2: { //Template
                TemplateViewController *templateViewController = [[TemplateViewController alloc] init];
                [self.navigationController pushViewController:templateViewController animated:YES];
                break;
            }
            case 3: { //Cancel
                break;
            }
            default:
                break;
        }
    }
    else
    {
        switch (buttonIndex)
        {
            case 0: { //Delete
                [_addImageImageView setImage:nil];
                [self.view addSubview:_addImageBackgroundLabel];
                [self.view addSubview:_addImageForegroundLabel];
                break;
            }
            case 1: { //Photo Library
                [_imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
                [self presentViewController:_imagePickerController animated:YES completion:NULL];
                break;
            }
            case 2: { //Camera
                [_imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
                [self presentViewController:_imagePickerController animated:YES completion:NULL];
                break;
            }
            case 3: { //Template
                TemplateViewController *templateViewController = [[TemplateViewController alloc] init];
                [self.navigationController pushViewController:templateViewController animated:YES];
                break;
            }
            case 4: { //Cancel
                break;
            }
            default:
                break;
        }
    }
}

// ================================================================================
#pragma mark - UIImagePickerControllerDelegate and UINavigationControllerDelegate
// ================================================================================
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [_addImageImageView setImage:image];
    [_addImageBackgroundLabel removeFromSuperview];
    [_addImageForegroundLabel removeFromSuperview];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// --------------------------------------------------------------------------------
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
// ================================================================================
#pragma mark - CategoryArrayDelegate
// ================================================================================


// --------------------------------------------------------------------------------


@end
