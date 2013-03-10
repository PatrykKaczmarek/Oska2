//
//  AddItemTextCell.h
//  Oska2
//
//  Created by Neru on 27/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EnhancedKeyboard.h"
// ================================================================================
//Declarations:
// ================================================================================
@interface TextCell : UITableViewCell <UITextFieldDelegate>
{
    
}
// --------------------------------------------------------------------------------
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) EnhancedKeyboard *enhancedKeyboard;
// --------------------------------------------------------------------------------

@end
