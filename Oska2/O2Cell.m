//
//  O2Cell.m
//  Oska2
//
//  Created by Neru on 19/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "O2Cell.h"

@implementation O2Cell

// ================================================================================
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
        [self setBackgroundColor:[UIColor yellowColor]];
        
        _mainLabel = [[UILabel alloc] init];
        [_mainLabel setBackgroundColor:[UIColor clearColor]];
        [_mainLabel setTextColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0]];
        [_mainLabel setTextAlignment:NSTextAlignmentLeft];
        [_mainLabel setFont:[UIFont systemFontOfSize:16.0f]];
        [self addSubview:_mainLabel];
        
        _detailLabelNameAmount = [[UILabel alloc] init];
        [_detailLabelNameAmount setBackgroundColor:[UIColor clearColor]];
        [_detailLabelNameAmount setTextColor:[UIColor brownColor]];
        [_detailLabelNameAmount setTextAlignment:NSTextAlignmentLeft];
        [_detailLabelNameAmount setFont:[UIFont systemFontOfSize:10.0f]];
        [self addSubview:_detailLabelNameAmount];
        
        _detailLabelNamePrice = [[UILabel alloc] init];
        [_detailLabelNamePrice setBackgroundColor:[UIColor clearColor]];
        [_detailLabelNamePrice setTextColor:[UIColor brownColor]];
        [_detailLabelNamePrice setTextAlignment:NSTextAlignmentLeft];
        [_detailLabelNamePrice setFont:[UIFont systemFontOfSize:10.0f]];
        [self addSubview:_detailLabelNamePrice];

        _detailLabelAmount = [[UILabel alloc] init];
        [_detailLabelAmount setBackgroundColor:[UIColor clearColor]];
        [_detailLabelAmount setTextColor:[UIColor brownColor]];
        [_detailLabelAmount setTextAlignment:NSTextAlignmentLeft];
        [_detailLabelAmount setFont:[UIFont systemFontOfSize:10.0f]];
        [self addSubview:_detailLabelAmount];
        
        _detailLabelPrice = [[UILabel alloc] init];
        [_detailLabelPrice setBackgroundColor:[UIColor clearColor]];
        [_detailLabelPrice setTextColor:[UIColor brownColor]];
        [_detailLabelPrice setTextAlignment:NSTextAlignmentLeft];
        [_detailLabelPrice setFont:[UIFont systemFontOfSize:10.0f]];
        [self addSubview:_detailLabelPrice];
        
        _o2ImageView = [[UIImageView alloc] init];
        [_o2ImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:_o2ImageView];
    }
    return self;
}

// --------------------------------------------------------------------------------
-(void)layoutSubviews
{
    [super layoutSubviews];

    CGSize detailLabelNamePriceSize = [_detailLabelNamePrice sizeThatFits:CGSizeMake(MAXFLOAT, 10.0f)];
    CGSize detailLabelNameAmountSize = [_detailLabelNameAmount sizeThatFits:CGSizeMake(MAXFLOAT, 10.0f)];
    CGSize detailLabelPriceSize = CGSizeMake(60.0f, 13.0f);
    CGSize detailLabelAmountSize = CGSizeMake(50.0f, 13.0f);
    CGSize o2ImageViewSize = CGSizeMake(32.0f, 32.0f);
    CGSize mainLabelSize = CGSizeMake(CGRectGetWidth(self.contentView.frame) - o2ImageViewSize.width - detailLabelPriceSize.width - detailLabelNamePriceSize.width - 20.0f, 26.0f);
    
    [_mainLabel setFrame:CGRectMake(CGRectGetMinX(self.contentView.frame) + 10.0f,
                                    CGRectGetMinY(self.contentView.frame) + 7.0f,
                                    mainLabelSize.width,
                                    mainLabelSize.height)];
    
    [_detailLabelNameAmount setFrame:CGRectMake(CGRectGetMaxX(self.contentView.frame) - o2ImageViewSize.width - detailLabelNamePriceSize.width- detailLabelPriceSize.width - 10.0f,
                                                CGRectGetMinY(self.contentView.frame) + 7.0f,
                                                detailLabelNameAmountSize.width,
                                                detailLabelNameAmountSize.height)];
    
    [_detailLabelNamePrice setFrame:CGRectMake(CGRectGetMaxX(self.contentView.frame) - o2ImageViewSize.width - detailLabelNamePriceSize.width- detailLabelPriceSize.width - 10.0f,
                                           CGRectGetMinY(self.contentView.frame) + 20.0f,
                                           detailLabelNamePriceSize.width,
                                           detailLabelNamePriceSize.height)];
    
    [_detailLabelAmount setFrame:CGRectMake(CGRectGetMaxX(self.contentView.frame) - o2ImageViewSize.width - detailLabelNameAmountSize.width- 19.0f,
                                            CGRectGetMinY(self.contentView.frame) + 7.0f,
                                            detailLabelAmountSize.width,
                                            detailLabelAmountSize.height)];
    
    [_detailLabelPrice setFrame:CGRectMake(CGRectGetMaxX(self.contentView.frame) - o2ImageViewSize.width - detailLabelPriceSize.width- 10.0f,
                                           CGRectGetMinY(self.contentView.frame) + 20.0f,
                                           detailLabelPriceSize.width,
                                           detailLabelPriceSize.height)];

    [_o2ImageView setFrame:CGRectMake(CGRectGetMaxX(self.contentView.frame) - 40.0f,
                                      CGRectGetMinY(self.contentView.frame) + 5.0f,
                                      o2ImageViewSize.width,
                                      o2ImageViewSize.height)];
}

// --------------------------------------------------------------------------------
//-(void)updateMainTimer:(id)sender
//{
//    FirstViewController *firstViewController = [[FirstViewController alloc] init];
//    [firstViewController.tableView reloadData];
//}
// --------------------------------------------------------------------------------
- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
}

@end
