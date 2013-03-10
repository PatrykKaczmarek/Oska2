//
//  FirstViewController.h
//  Oska2
//
//  Created by Neru on 15/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "O2Cell.h"
#import "SecondViewController.h"
#import "FirstHeaderView.h"
#import "SectionHeader.h"
#import "FirstDetailViewController.h"
#import "AddItemViewController.h"
#import "O2Constants.h"
#import "CurrencyPicker.h"


// ================================================================================
//Declarations:
// ================================================================================
@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate, SaveButtonDelegate>
{
    NSMutableArray *dataOfFruitsTableArray;
    NSMutableArray *dataOfVegetablesTableArray;
    NSMutableArray *dataOfFruitsPriceArray;
    NSMutableArray *dataOfFruitsAmountArray;
    NSMutableArray *ImagesOfFruitArray;
    NSMutableArray *ImagesOfVegetablesArray;
    NSString *textFieldOutputString;
    NSString *newDateString;
    UILabel *_headerLabel;
    NSIndexSet *_setAnimation;
    UIImage *_tabBarImageLeft;
    NSTimer *_mainTimer;
}
// --------------------------------------------------------------------------------
@property (nonatomic, strong) UIBarButtonItem *editBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *addBarButtonItem;
@property (nonatomic, strong) UIAlertView *addRecordAlertView;
@property (nonatomic, strong) UITextField *addRecordTextField;
@property (nonatomic, strong) UIAlertView *chooseRecordDestinationAlertView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *sectionHeaderView;
// --------------------------------------------------------------------------------

@end
