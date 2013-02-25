//
//  AddItemViewController.m
//  Oska2
//
//  Created by Neru on 25/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (id)init
{
    self = [super init];
    if (self) 
    {
        // Custom initialization
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
    
    _addItemButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_addItemButton setTitle:(NSLocalizedString(@"Add", nil)) forState:UIControlStateNormal];
//    [_addItemButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_addItemButton setBackgroundColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0]];
//    [_addItemButton setBackgroundColor:[UIColor redColor]];
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
    [_addTextField setFrame:CGRectMake(100.0f,
                                       20.0f,
                                       CGRectGetMaxX(self.view.frame) - CGRectGetWidth(_addImageButton.frame) - 50.0f,
                                       30.0f)];
    [_addItemButton setFrame:CGRectMake(CGRectGetMinX(self.view.frame) + 20.0f,
                                        CGRectGetMaxY(self.view.frame) - 20.0f - CGRectGetHeight(_addItemButton.frame),
                                        CGRectGetMaxX(self.view.frame) - 40.0f,
                                        20.0f)];
    [_addImageButton setFrame:CGRectMake(20.0f, 20.0f, 70.0f, 70.0f)];
    

}

/////////////////////////////////////////////////////////////////////////////////
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
