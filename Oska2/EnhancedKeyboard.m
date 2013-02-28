//
//  EnhancedKeyboard.m
//  Oska2
//
//  Created by Neru on 27/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "EnhancedKeyboard.h"

@implementation EnhancedKeyboard

/////////////////////////////////////////////////////////////////////////////////
- (UIToolbar *)prevEnabled:(BOOL)prevEnabled nextEnabled:(BOOL)nextEnabled;
{
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    
    NSMutableArray *toolbarItems = [[NSMutableArray alloc] init];
    
    UISegmentedControl *leftItems = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:NSLocalizedString(@"Previous", nil),  nil]];
    leftItems.segmentedControlStyle = UISegmentedControlStyleBar;
    [leftItems setEnabled:prevEnabled forSegmentAtIndex:0];
    leftItems.momentary = YES;
    [leftItems addTarget:self
                  action:@selector(previousDidClick:)
        forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem *prevControl = [[UIBarButtonItem alloc] initWithCustomView:leftItems];
    [toolbarItems addObject:prevControl];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                               target:self
                                                                               action:nil];
    [toolbarItems addObject:flexSpace];
    
    UISegmentedControl *rightItems = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:NSLocalizedString(@"Next", nil),  nil]];
    rightItems.segmentedControlStyle = UISegmentedControlStyleBar;
    [rightItems setEnabled:nextEnabled forSegmentAtIndex:0];
    rightItems.momentary = YES;
    [rightItems addTarget:self
                  action:@selector(nextDidClick:)
        forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *nextControl = [[UIBarButtonItem alloc] initWithCustomView:rightItems];
    [toolbarItems addObject:nextControl];
    
    toolbar.items = toolbarItems;
    
    return toolbar;
}

/////////////////////////////////////////////////////////////////////////////////
-(void)previousDidClick:(id)sender
{   
    NSLog(@"Prev");
    [_delegate prevDidTouchUpInside];
}

/////////////////////////////////////////////////////////////////////////////////
-(void)nextDidClick:(id)sender
{   
    NSLog(@"Next");
    [_delegate nextDidTouchUpInside];
}


@end
