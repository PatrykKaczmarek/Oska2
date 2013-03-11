//
//  SectionChooseCell.h
//  Oska2
//
//  Created by Neru on 10/03/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>

// ================================================================================
//Declarations:
// ================================================================================
@interface CategoryCell : UITableViewCell <UITextFieldDelegate>
{
    
}
// --------------------------------------------------------------------------------
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *chooseCategoryButton;
// --------------------------------------------------------------------------------

@end
