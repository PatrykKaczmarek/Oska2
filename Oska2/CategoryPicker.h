//
//  CategoryPicker.h
//  Oska2
//
//  Created by Neru on 10/03/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CancelDoneToolbar.h"

// ================================================================================
//Delegates:
// ================================================================================
@protocol CategoryPickerDelegate <NSObject>
-(void)categoryPickerDidChangeToCategory:(NSString *)category CategoryPickerDidChangeToRow:(NSInteger)row;
@end
// ================================================================================
//Declarations:
// ================================================================================
@interface CategoryPicker : UIActionSheet <UIPickerViewDelegate, UIPickerViewDataSource, CustomToolbarDelegate>
{
    UIToolbar *_pickerToolbar;
}
// --------------------------------------------------------------------------------
@property (nonatomic, strong) NSMutableArray *categoryArray;
@property (nonatomic, strong) UIPickerView *pickerView;
// --------------------------------------------------------------------------------
@property (nonatomic, strong) id <CategoryPickerDelegate> categoryDelegate;
// --------------------------------------------------------------------------------
-(void)scrollToSelectedValue:(NSString*)value;
// --------------------------------------------------------------------------------

@end
