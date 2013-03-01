//
//  FirstDetailViewController.m
//  Oska2
//
//  Created by Neru on 25/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "FirstDetailViewController.h"

@interface FirstDetailViewController ()

@end

// ================================================================================
@implementation FirstDetailViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        [self setTitle:NSLocalizedString(@"Details", nil)];
        [self.view setBackgroundColor:[UIColor yellowColor]];
    }
    return self;
}

// --------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(50, 50, 60, 30)];
    [button addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
                        
    _actionSheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"Choose currency", nil)
                                               delegate:nil
                                      cancelButtonTitle:nil
                                 destructiveButtonTitle:nil
                                      otherButtonTitles:nil];
    [_actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    _pickerView = [[UIPickerView alloc] init];
    [_pickerView setDataSource:self];
    [_pickerView setDelegate:self];
    _pickerView.showsSelectionIndicator = YES;
    [_pickerView setFrame:CGRectMake(0, 44, 320, 216)];
    [_actionSheet addSubview:_pickerView];
    
    _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [_toolbar setBarStyle:UIBarStyleDefault];
    [_toolbar sizeToFit];
    NSMutableArray *pickerToolbarButtons = [[NSMutableArray alloc] init];
    
    _cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                     style:UIBarButtonItemStyleBordered
                                                    target:self
                                                    action:@selector(cancelButtonDidTouchUpInside:)];
    [pickerToolbarButtons addObject:_cancelButton];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                               target:self
                                                                               action:nil];
    [pickerToolbarButtons addObject:flexSpace];
    
    
    _doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                   style:UIBarButtonItemStyleBordered
                                                  target:self
                                                  action:@selector(doneButtonDidTouchUpInside:)];
    [pickerToolbarButtons addObject:_doneButton];
    
    _toolbar.items = pickerToolbarButtons;
    [_actionSheet addSubview:_toolbar];
    
    [_actionSheet showInView:self.view];
    [_actionSheet setBounds:CGRectMake(0, 0, 320, 474)];
    
    _currencyMutableArray = [[NSMutableArray alloc] initWithObjects:NSLocalizedString(@"EUR", nil), NSLocalizedString(@"USD", nil), NSLocalizedString(@"CHF", nil), NSLocalizedString(@"CZK", nil), NSLocalizedString(@"GBP", nil), NSLocalizedString(@"PLN", nil), NSLocalizedString(@"RUB", nil), NSLocalizedString(@"JPY", nil), NSLocalizedString(@"HUF", nil),  nil];
}

// --------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// ================================================================================

#pragma mark - UIPickerViewDelegate and DataSource

// ================================================================================
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// --------------------------------------------------------------------------------
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_currencyMutableArray count];
}

// --------------------------------------------------------------------------------
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *result = nil;
    if ([pickerView isEqual:_pickerView])
    {
        result = [NSString stringWithFormat:@"%@", [_currencyMutableArray objectAtIndex:row]];
    }
    return result;
}

// ================================================================================

#pragma mark - UIBarButtonsItems - Actions

// ================================================================================
-(void)cancelButtonDidTouchUpInside:(id)sender
{
    [_actionSheet dismissWithClickedButtonIndex:0 animated:YES];
}

// --------------------------------------------------------------------------------
-(void)doneButtonDidTouchUpInside:(id)sender
{
//    [_label setText:[_currencyMutableArray objectAtIndex:row]];
    [_actionSheet dismissWithClickedButtonIndex:0 animated:YES];
}
-(void)clicked:(id)sender
{
//    [_actionSheet showInView:self.view];
}
@end
