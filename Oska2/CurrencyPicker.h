//
//  CurrencyPicker.h
//  Oska2
//
//  Created by Neru on 01/03/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddItemViewController.h"

@interface CurrencyPicker : UIActionSheet <UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIPickerView *_pickerView;
    NSMutableArray *_currencyMutableArray;
    UILabel *_label;
    UIToolbar *_pickerToolbar;
}

@property (nonatomic, strong) UIBarButtonItem *doneButton;
@property (nonatomic, strong) UIBarButtonItem *cancelButt;

@end
