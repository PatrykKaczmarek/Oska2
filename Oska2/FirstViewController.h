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
#import "Header.h"
#import "SectionHeader.h"
#import "FirstDetailViewController.h"
#import "AddItemViewController.h"

@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>
{
    NSMutableArray *dataOfFruitsTableArray;
    NSMutableArray *dataOfVegetablesTableArray;
    NSMutableArray *ImagesOfFruitArray;
    NSMutableArray *ImagesOfVegetablesArray;
    NSString *textFieldOutputString;
    NSString *newDateString;
    UILabel *_headerLabel;
    NSIndexSet *_setAnimation;
    UIImage *_tabBarImageLeft;
}

@property (nonatomic, strong) UIBarButtonItem *editBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *addBarButtonItem;
@property (nonatomic, strong) UIAlertView *addRecordAlertView;
@property (nonatomic, strong) UITextField *addRecordTextField;
@property (nonatomic, strong) UIAlertView *chooseRecordDestinationAlertView;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *sectionHeaderView;

@end
