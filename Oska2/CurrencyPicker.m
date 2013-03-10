//
//  CurrencyPicker.m
//  Oska2
//
//  Created by Neru on 01/03/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "CurrencyPicker.h"

@implementation CurrencyPicker

// ================================================================================
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
        [self setTitle:NSLocalizedString(@"Choose currency", nil)];
        
        _pickerView = [[UIPickerView alloc] init];
        [_pickerView setDataSource:self];
        [_pickerView setDelegate:self];
        _pickerView.showsSelectionIndicator = YES;
        [self addSubview:_pickerView];
        
        _pickerToolbar = [[UIToolbar alloc] init];
        [_pickerToolbar setBarStyle:UIBarStyleDefault];
        [_pickerToolbar sizeToFit];
        NSMutableArray *pickerToolbarButtons = [[NSMutableArray alloc] init];
        
        _cancelButt = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                         style:UIBarButtonItemStyleBordered
                                                        target:self
                                                        action:@selector(cancelButtonDidTouchUpInside:)];
        [pickerToolbarButtons addObject:_cancelButt];
        
        UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                   target:self
                                                                                   action:nil];
        [pickerToolbarButtons addObject:flexSpace];
        
        
        _doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                       style:UIBarButtonItemStyleBordered
                                                      target:self
                                                      action:@selector(doneButtonDidTouchUpInside:)];
        [pickerToolbarButtons addObject:_doneButton];
        
        _pickerToolbar.items = pickerToolbarButtons;
        [self addSubview:_pickerToolbar];
        
        
        
        _currencyMutableArray = [[NSMutableArray alloc] initWithObjects:NSLocalizedString(@"EUR", nil), NSLocalizedString(@"USD", nil), NSLocalizedString(@"CHF", nil), NSLocalizedString(@"CZK", nil), NSLocalizedString(@"GBP", nil), NSLocalizedString(@"PLN", nil), NSLocalizedString(@"RUB", nil), NSLocalizedString(@"JPY", nil), NSLocalizedString(@"HUF", nil),  nil];
    }
    return self;
}

// --------------------------------------------------------------------------------
-(void)layoutSubviews
{    
    [_pickerView setFrame:CGRectMake(0.0f,
                                     44.0f,
                                     CGRectGetWidth(self.frame),
                                     216.0f)];
    
    [_pickerToolbar setFrame:CGRectMake(0.0f,
                                        0.0f,
                                        CGRectGetWidth(self.frame),
                                        44.0f)];
    
    [self setBounds:CGRectMake(0.0f,
                               0.0f,
                               CGRectGetWidth(self.frame),
                               474.0f)];
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

// --------------------------------------------------------------------------------
-(void)scrollToSelectedValue:(NSString*)value
{
    [_pickerView selectRow:[_currencyMutableArray indexOfObject:value] inComponent:0 animated:NO];
}

// ================================================================================
#pragma mark - UIBarButtonsItems - Actions
// ================================================================================
-(void)cancelButtonDidTouchUpInside:(id)sender
{
    [self dismissWithClickedButtonIndex:0 animated:YES];
}

// --------------------------------------------------------------------------------
-(void)doneButtonDidTouchUpInside:(id)sender
{   
    if ([_currencyDelegate respondsToSelector:@selector(currencyPickerDidChangeToCurrency:)])
    {
        [_currencyDelegate currencyPickerDidChangeToCurrency:[_currencyMutableArray objectAtIndex:[_pickerView selectedRowInComponent:0]]];
    }    
    [self dismissWithClickedButtonIndex:0 animated:YES];
}

// --------------------------------------------------------------------------------
@end
