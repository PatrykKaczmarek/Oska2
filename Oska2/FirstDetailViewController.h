//
//  FirstDetailViewController.h
//  Oska2
//
//  Created by Neru on 25/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstDetailViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIActionSheet *_actionSheet;
    UIPickerView *_pickerView;
    NSMutableArray *_currencyMutableArray;
    UILabel *_label;
    UIToolbar *_toolbar;
    
}

@property (nonatomic, strong) UIBarButtonItem *doneButton;
@property (nonatomic, strong) UIBarButtonItem *cancelButton;

@end
