//
//  CurrencyPicker.h
//  Oska2
//
//  Created by Neru on 01/03/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>

// ================================================================================
//Delegates:
// ================================================================================
@protocol CurrencyPickerDelegate <NSObject>
-(void)currencyPickerDidChangeToCurrency:(NSString *)currency;
@end


// ================================================================================
//Declarations:
// ================================================================================
@interface CurrencyPicker : UIActionSheet <UIPickerViewDelegate, UIPickerViewDataSource>
{
    UILabel *_label;
    UIToolbar *_pickerToolbar;
}
// --------------------------------------------------------------------------------
@property (nonatomic, strong) NSMutableArray *currencyMutableArray;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) UIBarButtonItem *doneButton;
@property (nonatomic, strong) UIBarButtonItem *cancelButt;
// --------------------------------------------------------------------------------
@property (nonatomic, strong) id<CurrencyPickerDelegate> currencyDelegate;
// --------------------------------------------------------------------------------
-(void)scrollToSelectedValue:(NSString*)value;
// --------------------------------------------------------------------------------

@end
