//
//  AddItemViewController.m
//  Oska2
//
//  Created by Neru on 25/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "AddItemViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AddItemViewController ()

@end

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

/////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad
{
    [super viewDidLoad];
 
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
    
    
    _addTextField = [[UITextField alloc] init];
    [_addTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [_addTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [_addTextField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [_addTextField setTextAlignment:NSTextAlignmentLeft];
    [_addTextField setPlaceholder:(NSLocalizedString(@"Enter text here...", nil))];
    [_addTextField setDelegate:self];
    [_addTextField becomeFirstResponder];
    [self.view addSubview:_addTextField];
    
//    _addItemButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_addItemButton.layer setCornerRadius:8.0f];
//    [_addItemButton setTitle:(NSLocalizedString(@"Add", nil)) forState:UIControlStateNormal];
//    [_addItemButton setBackgroundColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0]];
//    [self.view addSubview:_addItemButton];
    
    _addImageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_addImageButton setTitle:(NSLocalizedString(@"Add Image", nil)) forState:UIControlStateNormal];
    [_addImageButton setBackgroundColor:[UIColor clearColor]];
    [_addImageButton setBackgroundImage:[UIImage imageNamed:@"noicon"] forState:UIControlStateNormal];
    
    [_addImageButton setTitleColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0] forState:UIControlStateNormal];
    [self.view addSubview:_addImageButton];
    
//    _addImageView = [[UIImageView alloc] init];
//    [_addImageView setImage:[UIImage imageNamed:@"noimage"]];
//    [_addImageView setContentMode:UIViewContentModeScaleAspectFit];
//    [self.view addSubview:_addImageView];
    
    //enhancedKeyboard:
//    self.enhancedKeyboard = [[EnhancedKeyboard alloc] init];
//    [self.enhancedKeyboard getToolbarWithPrevEnabled:YES NextEnabled:YES DoneEnabled:YES];

}

/////////////////////////////////////////////////////////////////////////////////
-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGFloat margin = 10.0f;
    CGSize addImageButtonSize = CGSizeMake(70.0f, 70.0f);
//    CGSize addItemButtonSize = CGSizeMake(CGRectGetMaxX(self.view.frame) - 2*margin, 35.0f);
    
    [_addImageButton setFrame:CGRectMake(margin,
                                         margin,
                                         addImageButtonSize.width,
                                         addImageButtonSize.height)];
    
    [_addTableView setFrame:CGRectMake(CGRectGetMaxX(_addImageButton.frame) + margin,
                                   CGRectGetMinY(_addImageButton.frame) - 10.0f,
                                   CGRectGetMaxX(self.view.frame) - CGRectGetMaxX(_addImageButton.frame) - 2*margin,
                                   225.0f)];
    
    [_addTextField setFrame:CGRectMake(margin,
                                       CGRectGetMaxY(_addImageButton.frame) + margin,
                                       70,
                                       30.0f)];
}

/////////////////////////////////////////////////////////////////////////////////
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/////////////////////////////////////////////////////////////////////////////////
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

/////////////////////////////////////////////////////////////////////////////////

#pragma mark - UITableView DataSource & Delegate

/////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

/////////////////////////////////////////////////////////////////////////////////
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

/////////////////////////////////////////////////////////////////////////////////
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    if (cell == nil)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        [cell setBackgroundColor:[UIColor redColor]];
    }
    return cell;
}

/////////////////////////////////////////////////////////////////////////////////

#pragma mark - UITextField delegate

/////////////////////////////////////////////////////////////////////////////////
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.enhancedKeyboard = [[EnhancedKeyboard alloc] init];
    [textField setInputAccessoryView:[self.enhancedKeyboard prevEnabled:YES nextEnabled:YES]];
}

/////////////////////////////////////////////////////////////////////////////////
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

/////////////////////////////////////////////////////////////////////////////////
-(BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}

/////////////////////////////////////////////////////////////////////////////////
@end
