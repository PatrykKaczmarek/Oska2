//
//  AddItemViewController.h
//  Oska2
//
//  Created by Neru on 25/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "EnhancedKeyboard.h"
#import "TextCell.h"
#import "AmountCell.h"
#import "PriceCell.h"
#import "CategoryCell.h"
#import "CurrencyPicker.h"
#import "CategoryPicker.h"
#import "TemplateViewController.h"

// ================================================================================
//Delegates:
// ================================================================================
@protocol SaveButtonDelegate <NSObject>
-(void)productName:(NSString *)productName productAmount:(NSString *)productAmount productPrice:(NSString *)productPrice productDescription:(NSString *)productDescription priceCurrency:(NSString *)priceCurrency productImage:(UIImage *)productImage;
@end

//@protocol CategoryArrayDelegate <NSObject>
//-(void)CategoryArray:(NSMutableArray *)categoryArray;
//@end
// ================================================================================
//Declarations:
// ================================================================================
@interface AddItemViewController : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, EnhancedKeyboardDelegate, CurrencyPickerDelegate>
{
    NSMutableArray *_textFieldMutableArray;
    UILabel *_addImageForegroundLabel;
    UILabel *_addImageBackgroundLabel;
    UIImageView *_addImageImageView;
    UIImagePickerController *_imagePickerController;
    NSString *_currencyDidChoose;
    UIBarButtonItem *_saveButtonItem;
}
// --------------------------------------------------------------------------------
@property (nonatomic, strong) UITableView *addTableView;
@property (nonatomic, strong) NSMutableArray *categoryArray;
// --------------------------------------------------------------------------------
@property (nonatomic, strong) EnhancedKeyboard *enhancedKeyboard;
// --------------------------------------------------------------------------------
@property (nonatomic, strong) id <SaveButtonDelegate> delegate;
//@property (nonatomic, strong) id <CategoryArrayDelegate> categoryDelegate;
// --------------------------------------------------------------------------------
-(void)currencyButtonDidClick;
// --------------------------------------------------------------------------------
@end
