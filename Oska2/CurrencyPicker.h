//
//  CurrencyPicker.h
//  Oska2
//
//  Created by Neru on 01/03/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CurrencyPickerDelegate <NSObject>

-(void)currencyPickerDidChangeToCurrency:(NSString *)currency;

@end

@interface CurrencyPicker : UIActionSheet <UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIPickerView *_pickerView;
    NSMutableArray *_currencyMutableArray;
    UILabel *_label;
    UIToolbar *_pickerToolbar;
}

@property (nonatomic, strong) UIBarButtonItem *doneButton;
@property (nonatomic, strong) UIBarButtonItem *cancelButt;
@property (nonatomic, strong) id<CurrencyPickerDelegate> currencyDelegate;

-(void)scrollToSelectedValue:(NSString*)value;

@end
