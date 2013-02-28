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
#import "AddItemTextCell.h"
#import "AddItemAmountCell.h"

@interface AddItemViewController : UIViewController <UITextFieldDelegate,
                                                     UITableViewDataSource,
                                                     UITableViewDelegate,
                                                     EnhancedKeyboardDelegate>
{
    UIImageView *_addImageView;
    UIImageView *_choiseOfImagesImageView;
    UIButton *_addItemButton;
    UIButton *_addImageButton;
}

@property (nonatomic, strong) UITableView *addTableView;
@property (nonatomic, strong) EnhancedKeyboard *enhancedKeyboard;


@end
