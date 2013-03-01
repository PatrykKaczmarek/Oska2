//
//  EnhancedKeyboard.m
//  Oska2
//
//  Created by Neru on 27/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "EnhancedKeyboard.h"

@implementation EnhancedKeyboard

// ================================================================================
- (UIToolbar *)prevEnabled:(BOOL)prevEnabled nextEnabled:(BOOL)nextEnabled;
{
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    
    NSMutableArray *toolbarButtons = [[NSMutableArray alloc] init];
    
    _previousButton = [[UIBarButtonItem alloc] initWithTitle:@"Previous"
                                                       style:UIBarButtonItemStyleBordered
                                                      target:self
                                                      action:@selector(prevDidTouchUpInside:)];
    [toolbarButtons addObject:_previousButton];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                               target:self
                                                                               action:nil];
    [toolbarButtons addObject:flexSpace];
    
    _nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                   style:UIBarButtonItemStyleBordered
                                                  target:self
                                                  action:@selector(nextDidTouchUpInside:)];
    [toolbarButtons addObject:_nextButton];
    
    toolbar.items = toolbarButtons;
    return toolbar;
}

// --------------------------------------------------------------------------------
-(void)prevDidTouchUpInside:(id)sender
{
    if ([_delegate respondsToSelector:@selector(prevDidTouchUpInside)])
    {
        [_delegate prevDidTouchUpInside];
    }
}

// --------------------------------------------------------------------------------
-(void)nextDidTouchUpInside:(id)sender
{
    if ([_delegate respondsToSelector:@selector(nextDidTouchUpInside)])
    {
        [_delegate nextDidTouchUpInside];
    }
}


@end
