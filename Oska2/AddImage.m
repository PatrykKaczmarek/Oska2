//
//  AddImage.m
//  Oska2
//
//  Created by Neru on 01/03/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "AddImage.h"

@implementation AddImage

// ================================================================================
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
        
        _choosePhotoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_choosePhotoButton setTitle:NSLocalizedString(@"Choose Photo", nil) forState:UIControlStateNormal];
        [self addSubview:_choosePhotoButton];
        
        _chooseTemplate = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_chooseTemplate setTitle:NSLocalizedString(@"Choose Template", nil) forState:UIControlStateNormal];
        [self addSubview:_chooseTemplate];
        
        _takeAPhotoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_takeAPhotoButton setTitle:NSLocalizedString(@"Take a photo", nil) forState:UIControlStateNormal];
        [self addSubview:_takeAPhotoButton];
        
        _clearButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_clearButton setTitle:NSLocalizedString(@"Clear", nil) forState:UIControlStateNormal];
        [self addSubview:_clearButton];
        
        _cancelButt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_cancelButt setTitle:NSLocalizedString(@"Cancel", nil) forState:UIControlStateNormal];
        [self addSubview:_cancelButt];
        
    }
    return self;
}

// --------------------------------------------------------------------------------
-(void)layoutSubviews
{
    float margin = 10.0f;
    float spaceBetweenButtons = 15.0f;
    float buttonsHeight = 30.0f;
    AddItemViewController *addItemViewController = [[AddItemViewController alloc] init];
    
    [self setBounds:CGRectMake(0.0f,
                               0.0f,
                               CGRectGetWidth(addItemViewController.view.frame),
                               444.0f)];
    
    [_choosePhotoButton setFrame:CGRectMake(margin,
                                            margin,
                                            CGRectGetWidth(addItemViewController.view.frame) - 2*margin,
                                            buttonsHeight)];
    
    [_chooseTemplate setFrame:CGRectMake(margin,
                                         CGRectGetMaxY(_choosePhotoButton.frame) + spaceBetweenButtons,
                                         CGRectGetWidth(addItemViewController.view.frame) - 2*margin,
                                         buttonsHeight)];
    
    [_takeAPhotoButton setFrame:CGRectMake(margin,
                                           CGRectGetMaxY(_chooseTemplate.frame) + spaceBetweenButtons,
                                           CGRectGetWidth(addItemViewController.view.frame) - 2*margin,
                                           buttonsHeight)];
    
    [_clearButton setFrame:CGRectMake(margin,
                                      CGRectGetMaxY(_takeAPhotoButton.frame) + spaceBetweenButtons,
                                      CGRectGetWidth(addItemViewController.view.frame) - 2*margin,
                                      buttonsHeight)];
    
    [_cancelButt setFrame:CGRectMake(margin,
                                     CGRectGetMaxY(_clearButton.frame) + spaceBetweenButtons,
                                     CGRectGetWidth(addItemViewController.view.frame) - 2*margin,
                                     buttonsHeight)];
    
    
}

@end
