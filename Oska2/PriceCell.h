//
//  PriceCell.h
//  Oska2
//
//  Created by Neru on 01/03/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EnhancedKeyboard.h"

// ================================================================================
//Declarations:
// ================================================================================
@interface PriceCell : UITableViewCell <UITextFieldDelegate>
{
    UIActionSheet *_actionSheet;
    UIPickerView *_pickerView;
}
// --------------------------------------------------------------------------------
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIBarButtonItem *doneButton;
@property (nonatomic, strong) UIBarButtonItem *cancelButton;
@property (nonatomic, strong) UIButton *currencyButton;
@property (nonatomic, strong) NSString *currencyName;
// --------------------------------------------------------------------------------
@property (nonatomic, strong) EnhancedKeyboard *enhancedKeyboard;
// --------------------------------------------------------------------------------

@end
