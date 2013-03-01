//
//  SectionHeader.m
//  Oska2
//
//  Created by Neru on 25/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "SectionHeader.h"

@implementation SectionHeader

// ================================================================================
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor:[UIColor clearColor]];
        
        _sectionHeaderLabel = [[UILabel alloc] init];
        [_sectionHeaderLabel setBackgroundColor:[UIColor clearColor]];
        [_sectionHeaderLabel setTextAlignment:NSTextAlignmentCenter];
        [_sectionHeaderLabel setFont:[UIFont fontWithName:@"Palatino-Italic" size:19.0f]];
        [_sectionHeaderLabel setTextColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0]];
        [self addSubview:_sectionHeaderLabel];
    }
    return self;
}

// --------------------------------------------------------------------------------
-(void)layoutSubviews
{
    [_sectionHeaderLabel setFrame:CGRectMake(0.0f,
                                             0.0f,
                                             CGRectGetWidth(self.frame),
                                             CGRectGetHeight(self.frame))];
}

// --------------------------------------------------------------------------------
@end
