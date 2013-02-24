//
//  O2Cell.m
//  Oska2
//
//  Created by Neru on 19/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "O2Cell.h"

@implementation O2Cell

/////////////////////////////////////////////////////////////////////////////////
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
        [self setBackgroundColor:[UIColor yellowColor]];
        
        _mainLabel = [[UILabel alloc] init];
        [_mainLabel setBackgroundColor:[UIColor redColor]];
        [_mainLabel setTextColor:[UIColor blueColor]];
        [_mainLabel setTextAlignment:NSTextAlignmentLeft];
        [_mainLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [self addSubview:_mainLabel];
        

        _detailLabel = [[UILabel alloc] init];
        [_detailLabel setBackgroundColor:[UIColor greenColor]];
        [_detailLabel setTextColor:[UIColor brownColor]];
        [_detailLabel setTextAlignment:NSTextAlignmentRight];
        [_detailLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [self addSubview:_detailLabel];
        
        _o2ImageView = [[UIImageView alloc] init];
        [self addSubview:_o2ImageView];
    }
    return self;
}

/////////////////////////////////////////////////////////////////////////////////
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize mainLabelSize = [_mainLabel sizeThatFits:CGSizeMake(CGRectGetWidth(self.contentView.frame) - 20.0f, MAXFLOAT)];
    CGSize detailLabelSize = [_detailLabel sizeThatFits:CGSizeMake(CGRectGetWidth(self.contentView.frame) - 20.0f, MAXFLOAT)];
    CGSize o2ImageviewSize = [_o2ImageView sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    
    [_mainLabel setFrame:CGRectMake(CGRectGetMinX(self.contentView.frame) + 10.0f,
                                    CGRectGetMinY(self.contentView.frame) + 10.0f,
                                    mainLabelSize.width,
                                    mainLabelSize.height)];
    
    [_detailLabel setFrame:CGRectMake(CGRectGetMinX(self.contentView.frame) + 10.0f,
                                      CGRectGetMinY(self.contentView.frame) + 20.0f,
                                      (CGRectGetMaxX(self.contentView.frame) - CGRectGetWidth(self.accessoryView.frame)),
                                      detailLabelSize.height)];
    
    [_o2ImageView setFrame:CGRectMake(CGRectGetMaxX(self.contentView.frame) - 40.0f,
                                      CGRectGetMinY(self.contentView.frame) + 5.0f,
                                      o2ImageviewSize.width,
                                      o2ImageviewSize.height)];
}

/////////////////////////////////////////////////////////////////////////////////
- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
}

@end
