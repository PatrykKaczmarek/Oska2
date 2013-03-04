//
//  AddItemViewController.h
//  Oska2
//
//  Created by Neru on 25/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "FirstViewController.h"
#import "EnhancedKeyboard.h"
#import "TextCell.h"
#import "AmountCell.h"
#import "PriceCell.h"
#import "CurrencyPicker.h"

@interface AddItemViewController : UIViewController <UITextFieldDelegate,
                                                     UITableViewDataSource,
                                                     UITableViewDelegate,
                                                     UIActionSheetDelegate,
                                                     EnhancedKeyboardDelegate, CurrencyPickerDelegate>
{
    NSMutableArray *_textFieldMutableArray;
    UILabel *_addImageForegroundLabel;
    UILabel *_addImageBackgroundLabel;
    UIImageView *_addImageImageView;
}

@property (nonatomic, strong) UITableView *addTableView;
@property (nonatomic, strong) EnhancedKeyboard *enhancedKeyboard;

-(void)currencyButtonDidClick;

@end
