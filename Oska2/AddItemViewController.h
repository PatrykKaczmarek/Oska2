//
//  AddItemViewController.h
//  Oska2
//
//  Created by Neru on 25/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"

@interface AddItemViewController : UIViewController <UITextFieldDelegate>
{
    UIImageView *_addImageView;
    UIImageView *_choiseOfImagesImageView;
    UITextField *_addTextField;
    UITextView *_commentTextView;
    UIButton *_addItemButton;
    UIButton *_addImageButton;
}


@end
