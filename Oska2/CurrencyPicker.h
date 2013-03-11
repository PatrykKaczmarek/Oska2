//
//  CurrencyPicker.h
//  Oska2
//
//  Created by Neru on 01/03/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CancelDoneToolbar.h"

// ================================================================================
//Delegates:
// ================================================================================
@protocol CurrencyPickerDelegate <NSObject>
-(void)currencyPickerDidChangeToCurrency:(NSString *)currency;
@end

// ================================================================================
//Declarations:
// ================================================================================
@interface CurrencyPicker : UIActionSheet <UIPickerViewDelegate, UIPickerViewDataSource, CustomToolbarDelegate>
{
    UIToolbar *_pickerToolbar;
}
// --------------------------------------------------------------------------------
@property (nonatomic, strong) NSMutableArray *currencyArray;
@property (nonatomic, strong) UIPickerView *pickerView;
// --------------------------------------------------------------------------------
@property (nonatomic, strong) id<CurrencyPickerDelegate> currencyDelegate;
// --------------------------------------------------------------------------------
-(void)scrollToSelectedValue:(NSString*)value;
// --------------------------------------------------------------------------------

@end
