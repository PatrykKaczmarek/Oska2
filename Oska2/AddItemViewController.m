//
//  AddItemViewController.m
//  Oska2
//
//  Created by Neru on 25/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "AddItemViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (id)init
{
    self = [super init];
    if (self) 
    {
        [self setTitle:(NSLocalizedString(@"New Item", nil))];
        [self.view setBackgroundColor:[UIColor yellowColor]];
    }
    return self;
}

/////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _addTextField = [[UITextField alloc] init];
    [_addTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [_addTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [_addTextField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [_addTextField setTextAlignment:NSTextAlignmentLeft];
    [_addTextField setPlaceholder:(NSLocalizedString(@"Enter text here...", nil))];
//    [_addTextField setText:@"jakis tekst"];
    [_addTextField setDelegate:self];
    [self.view addSubview:_addTextField];
    
    _addItemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addItemButton.layer setCornerRadius:8.0f];
    [_addItemButton setTitle:(NSLocalizedString(@"Add", nil)) forState:UIControlStateNormal];
    [_addItemButton setBackgroundColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0]];
    [self.view addSubview:_addItemButton];
    
    _addImageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_addImageButton setTitle:(NSLocalizedString(@"Add Image", nil)) forState:UIControlStateNormal];
    [_addImageButton setBackgroundColor:[UIColor clearColor]];
    [_addImageButton setBackgroundImage:[UIImage imageNamed:@"noicon"] forState:UIControlStateNormal];
    
    [_addImageButton setTitleColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0] forState:UIControlStateNormal];
    [self.view addSubview:_addImageButton];
    
//    _addImageView = [[UIImageView alloc] init];
//    [_addImageView setImage:[UIImage imageNamed:@"noimage"]];
//    [_addImageView setContentMode:UIViewContentModeScaleAspectFit];
//    [self.view addSubview:_addImageView];

}

/////////////////////////////////////////////////////////////////////////////////
-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGFloat margin = 10.0f;
    CGSize addImageButtonSize = CGSizeMake(70.0f, 70.0f);
    CGSize addItemButtonSize = CGSizeMake(CGRectGetMaxX(self.view.frame) - 2*margin, 35.0f);
    
    [_addImageButton setFrame:CGRectMake(margin,
                                         margin,
                                         addImageButtonSize.width,
                                         addImageButtonSize.height)];
    
    [_addTextField setFrame:CGRectMake(CGRectGetMaxX(_addImageButton.frame) + margin,
                                       CGRectGetMinY(_addImageButton.frame),
                                       CGRectGetMaxX(self.view.frame) - CGRectGetMaxX(_addImageButton.frame) - 2*margin,
                                       30.0f)];
    
    [_addItemButton setFrame:CGRectMake(margin,
                                        CGRectGetMaxY(self.view.frame) - margin - addItemButtonSize.height,
                                        addItemButtonSize.width,
                                        addItemButtonSize.height)];
}

/////////////////////////////////////////////////////////////////////////////////
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField delegate

/////////////////////////////////////////////////////////////////////////////////
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

/////////////////////////////////////////////////////////////////////////////////
-(BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}

@end
