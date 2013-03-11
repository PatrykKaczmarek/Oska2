//
//  CancelDoneToolbar.h
//  Oska2
//
//  Created by Neru on 11/03/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>

// ================================================================================
//Delegates:
// ================================================================================
@protocol CustomToolbarDelegate <NSObject>
-(void)cancelAction;
-(void)doneAction;
@end
// ================================================================================
//Declarations:
// ================================================================================
@interface CancelDoneToolbar : UIToolbar
{
    
}
// --------------------------------------------------------------------------------
@property (nonatomic, strong) UIBarButtonItem *doneButton;
@property (nonatomic, strong) UIBarButtonItem *customCancelButton;
// --------------------------------------------------------------------------------
@property (nonatomic, strong)id <CustomToolbarDelegate> customDelegate;
// --------------------------------------------------------------------------------
@end
