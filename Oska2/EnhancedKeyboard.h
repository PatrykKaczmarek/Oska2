//
//  EnhancedKeyboard.h
//  Oska2
//
//  Created by Neru on 27/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EnhancedKeyboardDelegate <NSObject>

-(void)nextDidTouchUpInside;
-(void)prevDidTouchUpInside;

@end

/////////////////////////////////////////////////////////////////////////////////
@interface EnhancedKeyboard : NSObject

-(id)prevEnabled:(BOOL)prevEnabled nextEnabled:(BOOL)nextEnabled;
@property (nonatomic, strong) id <EnhancedKeyboardDelegate> delegate;

@property (nonatomic, strong) UIBarButtonItem *previousButton;
@property (nonatomic, strong) UIBarButtonItem *nextButton;

@end
