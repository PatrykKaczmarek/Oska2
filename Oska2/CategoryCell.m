//
//  SectionChooseCell.m
//  Oska2
//
//  Created by Neru on 10/03/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "CategoryCell.h"

@implementation CategoryCell

// ================================================================================
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _textField = [[UITextField alloc] init];
        [_textField setDelegate:self];
        [_textField setBorderStyle:UITextBorderStyleNone];
        [_textField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [_textField setTextAlignment:NSTextAlignmentLeft];
        [_textField setPlaceholder:NSLocalizedString(@"Category", nil)];
        [_textField setTextColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0]];
        [self addSubview:_textField];
        
        _chooseCategoryButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_chooseCategoryButton setTitle:NSLocalizedString(@"Choose", nil) forState:UIControlStateNormal];
        [_chooseCategoryButton setTintColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0]];
        [self addSubview:_chooseCategoryButton];
    }
    return self;
}

// --------------------------------------------------------------------------------
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    float marginOfTextField = 10.0f;
    float marginOfButton = 5.0f;
    CGSize chooseCategoryButtonSize = CGSizeMake(70.0f, 30.0f);
    
    [_textField setFrame:CGRectMake(CGRectGetMinX(self.contentView.frame) + marginOfTextField,
                                    CGRectGetMinY(self.contentView.frame),
                                    CGRectGetWidth(self.contentView.frame) - 2*marginOfTextField - marginOfButton - chooseCategoryButtonSize.width,
                                    CGRectGetHeight(self.contentView.frame))];
    
    [_chooseCategoryButton setFrame:CGRectMake(CGRectGetMaxX(self.contentView.frame) - marginOfButton - chooseCategoryButtonSize.width,
                                               marginOfButton,
                                               chooseCategoryButtonSize.width,
                                               chooseCategoryButtonSize.height)];
}

// --------------------------------------------------------------------------------
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}

// --------------------------------------------------------------------------------


//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//}

@end
