//
//  AddItemTextCell.m
//  Oska2
//
//  Created by Neru on 27/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "TextCell.h"

@implementation TextCell

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
        [_textField setTextColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0]];
        [_textField setDelegate:self];
        
        [self addSubview:_textField];
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
    float margin = 10.0f;

    [_textField setFrame:CGRectMake(CGRectGetMinX(self.contentView.frame) + margin,
                                    CGRectGetMinY(self.contentView.frame),
                                    CGRectGetWidth(self.contentView.frame) - 2*margin,
                                    CGRectGetHeight(self.contentView.frame))];
}

// --------------------------------------------------------------------------------
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.enhancedKeyboard = [[EnhancedKeyboard alloc] init];
    [textField setInputAccessoryView:[self.enhancedKeyboard prevEnabled:YES nextEnabled:YES]];
}
@end
