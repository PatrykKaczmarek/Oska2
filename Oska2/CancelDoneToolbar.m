//
//  CancelDoneToolbar.m
//  Oska2
//
//  Created by Neru on 11/03/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "CancelDoneToolbar.h"

// ================================================================================
@implementation CancelDoneToolbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBarStyle:UIBarStyleDefault];
        [self sizeToFit];
        NSMutableArray *toolbarButtons = [[NSMutableArray alloc] init];
        
        _customCancelButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Cancel", nil)
                                                       style:UIBarButtonItemStyleBordered
                                                      target:self
                                                      action:@selector(cancelAction)];
        [toolbarButtons addObject:_customCancelButton];
        
        UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                   target:self
                                                                                   action:nil];
        [toolbarButtons addObject:flexSpace];
        
        
        _doneButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Done", nil)
                                                       style:UIBarButtonItemStyleBordered
                                                      target:self
                                                      action:@selector(doneAction)];
        [toolbarButtons addObject:_doneButton];
        
        self.items = toolbarButtons;
        
    }
    return self;
}

// --------------------------------------------------------------------------------
-(void)cancelAction
{
    if ([_customDelegate respondsToSelector:@selector(cancelAction)])
    {
        [_customDelegate cancelAction];
    }
    
}

// --------------------------------------------------------------------------------
-(void)doneAction
{
    if ([_customDelegate respondsToSelector:@selector(doneAction)])
    {
        [_customDelegate doneAction];
    }
}

// --------------------------------------------------------------------------------
@end
