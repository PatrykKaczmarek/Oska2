//
//  Header.m
//  Oska2
//
//  Created by Neru on 24/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "FirstHeaderView.h"

@implementation FirstHeaderView

// ================================================================================
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        
        _headerLabel = [[UILabel alloc] init];
        [_headerLabel setText:NSLocalizedString(@"Your pantry", nil)];
        [_headerLabel setFont:[UIFont fontWithName:@"Palatino-Italic" size:25.0f]];
        [_headerLabel setTextColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0]];
        [_headerLabel setBackgroundColor:[UIColor clearColor]];
        [_headerLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_headerLabel];
        
        _headerImageLeft = [[UIImageView alloc] init];
        [_headerImageLeft setImage:[UIImage imageNamed:@"fruits"]];
        [self addSubview:_headerImageLeft];
        
        _headerImageRight = [[UIImageView alloc] init];
        [_headerImageRight setImage:[UIImage imageNamed:@"fruits"]];
        [self addSubview:_headerImageRight];
    }
    return self;
}

// --------------------------------------------------------------------------------
-(void)layoutSubviews
{
    [super layoutSubviews];

    [_headerLabel setFrame:CGRectMake((CGRectGetHeight(self.frame) + 10.0f),
                                      10.0f,
                                      CGRectGetWidth(self.frame) - (CGRectGetHeight(self.frame) * 2.0f + 20.0f),
                                      CGRectGetHeight(self.frame) - 20.0f)];
    
    [_headerImageLeft setFrame:CGRectMake(10.0f,
                                          0.0f,
                                          CGRectGetHeight(self.frame),
                                          CGRectGetHeight(self.frame))];
    
    [_headerImageRight setFrame:CGRectMake((CGRectGetMaxX(self.frame) - CGRectGetHeight(self.frame) - 10.0f),
                                           0.0f,
                                           CGRectGetHeight(self.frame),
                                           CGRectGetHeight(self.frame))];
}

// --------------------------------------------------------------------------------
@end
