//
//  EnhancedKeyboard.h
//  Oska2
//
//  Created by Neru on 27/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <Foundation/Foundation.h>
// ================================================================================
//Delegates:
// ================================================================================
@protocol EnhancedKeyboardDelegate <NSObject>
-(void)nextDidTouchUpInside;
-(void)prevDidTouchUpInside;
@end
// ================================================================================
//Declarations:
// ================================================================================
@interface EnhancedKeyboard : NSObject
{
    
}
// --------------------------------------------------------------------------------
@property (nonatomic, strong) UIBarButtonItem *previousButton;
@property (nonatomic, strong) UIBarButtonItem *nextButton;
// --------------------------------------------------------------------------------
@property (nonatomic, strong) id <EnhancedKeyboardDelegate> delegate;
// --------------------------------------------------------------------------------
-(id)prevEnabled:(BOOL)prevEnabled nextEnabled:(BOOL)nextEnabled;
// --------------------------------------------------------------------------------

@end
