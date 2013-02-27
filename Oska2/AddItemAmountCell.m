//
//  AddItemAmountCell.m
//  Oska2
//
//  Created by Neru on 27/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "AddItemAmountCell.h"

@implementation AddItemAmountCell

/////////////////////////////////////////////////////////////////////////////////
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        amount = 1;
        
        _textField = [[UITextField alloc] init];
        [_textField setBorderStyle:UITextBorderStyleNone];
        [_textField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [_textField setTextAlignment:NSTextAlignmentCenter];
        [_textField setKeyboardType:UIKeyboardTypeNumberPad];
        [_textField setTextColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0]];
        [_textField setText:[NSString stringWithFormat:@"%d", amount]];
        [_textField setDelegate:self];
        [self addSubview:_textField];
        
        _rightMinusButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_rightMinusButton setTitle:@"+" forState:UIControlStateNormal];
        [_rightMinusButton addTarget:self
                            action:@selector(plusDidClick:)
                  forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightMinusButton];
        
        _leftPlusButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_leftPlusButton setTitle:@"-" forState:UIControlStateNormal];
        [_leftPlusButton addTarget:self
                              action:@selector(minusDidClick:)
                    forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftPlusButton];
    }
    return self;
}

/////////////////////////////////////////////////////////////////////////////////
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

/////////////////////////////////////////////////////////////////////////////////
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    float marginOfTextField = 40.0f;
    float marginOfButton = 5.0f;
    CGSize leftPlusButtonSize = CGSizeMake(30.0f, 30.0f);
    CGSize rightPlusButtonSize = CGSizeMake(30.0f, 30.0f);
    
    [_textField setFrame:CGRectMake(CGRectGetMinX(self.contentView.frame) + marginOfTextField,
                                    CGRectGetMinY(self.contentView.frame),
                                    CGRectGetWidth(self.contentView.frame) - 2*marginOfTextField,
                                    CGRectGetHeight(self.contentView.frame))];
    
    [_leftPlusButton setFrame:CGRectMake(CGRectGetMinX(self.contentView.frame) + marginOfButton,
                                         marginOfButton,
                                         leftPlusButtonSize.width,
                                         leftPlusButtonSize.height)];
    
    [_rightMinusButton setFrame:CGRectMake(CGRectGetMaxX(self.contentView.frame) - rightPlusButtonSize.width - marginOfButton,
                                         marginOfButton,
                                         rightPlusButtonSize.width,
                                         rightPlusButtonSize.height)];
}
/////////////////////////////////////////////////////////////////////////////////

#pragma mark - UITextField Delegate

/////////////////////////////////////////////////////////////////////////////////
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.enhancedKeyboard = [[EnhancedKeyboard alloc] init];
    [textField setInputAccessoryView:[self.enhancedKeyboard prevEnabled:YES nextEnabled:YES]];
//    EnhancedKeyboard *enhancedKeyboard = [[EnhancedKeyboard alloc] init];
//    [textField setInputAccessoryView:[enhancedKeyboard prevEnabled:YES nextEnabled:YES]];
    return YES;
}

/////////////////////////////////////////////////////////////////////////////////

#pragma mark - UIButtons

/////////////////////////////////////////////////////////////////////////////////
-(void)plusDidClick:(id)sender
{
    amount = [[_textField text] intValue];
    amount = amount + 1;
    [_textField setText:[NSString stringWithFormat:@"%d", amount]];
}

/////////////////////////////////////////////////////////////////////////////////
-(void)minusDidClick:(id)sender
{
    if ([[_textField text] intValue] >= 1)
    {
        amount = [[_textField text] intValue];
        amount = amount - 1;
        [_textField setText:[NSString stringWithFormat:@"%d", amount]];
    }
    
}

@end
