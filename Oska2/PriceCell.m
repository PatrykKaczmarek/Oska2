//
//  PriceCell.m
//  Oska2
//
//  Created by Neru on 01/03/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "PriceCell.h"

@implementation PriceCell

// ================================================================================
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        _textField = [[UITextField alloc] init];
        [_textField setBorderStyle:UITextBorderStyleNone];
        [_textField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [_textField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [_textField setTextAlignment:NSTextAlignmentLeft];
        [_textField setKeyboardType:UIKeyboardTypeNumberPad];
        [_textField setTextColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0]];
        [_textField setPlaceholder:NSLocalizedString(@"Enter price here", nil)];
        [_textField setDelegate:self];
        [self addSubview:_textField];
        
        _currencyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_currencyButton setTitle:@"EUR" forState:UIControlStateNormal];
        [_currencyButton setTintColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0]];
        [_currencyButton    addTarget:self
                               action:@selector(currencyButtonDidClick:)
                     forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_currencyButton];
    }
    return self;
}

// --------------------------------------------------------------------------------
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//    
//    // Configure the view for the selected state
//}

// --------------------------------------------------------------------------------
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGSize _currencyButtonSize = CGSizeMake(50.0f, 30.0f);
    float marginOfButton = 5.0f;
    float margin = 10.0f;
    
    [_textField setFrame:CGRectMake(CGRectGetMinX(self.contentView.frame) + margin,
                                    CGRectGetMinY(self.contentView.frame),
                                    CGRectGetWidth(self.contentView.frame) - _currencyButtonSize.width - 2*marginOfButton - margin,
                                    CGRectGetHeight(self.contentView.frame))];
    
    [_currencyButton setFrame:CGRectMake(CGRectGetMaxX(_textField.frame) + marginOfButton,
                                         marginOfButton,
                                         _currencyButtonSize.width,
                                         _currencyButtonSize.height)];
}

// --------------------------------------------------------------------------------
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.enhancedKeyboard = [[EnhancedKeyboard alloc] init];
    [textField setInputAccessoryView:[self.enhancedKeyboard prevEnabled:YES nextEnabled:YES]];
}
// --------------------------------------------------------------------------------

-(void)currencyButtonDidClick:(id)sender
{
    AddItemViewController *addItemViewController = [[AddItemViewController alloc] init];
    [addItemViewController currencyButtonDidClick];
}

@end
