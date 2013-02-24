//
//  FirstViewController.h
//  Oska2
//
//  Created by Neru on 15/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "O2Cell.h"

@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>
{
    NSMutableArray *listOfCountriesNames;
//    NSMutableArray *dataOfFruitsTableArray;
//    NSMutableArray *dataOfVegetablesTableArray;
//    NSMutableArray *dataOfTableViewCellPicturesArray;
    NSString *textFieldOutputString;
    NSString *newDateString;
    UIBarButtonItem *editBarButtonItem;
    UIBarButtonItem *addBarButtonItem;
    UIAlertView *addRecordAlertView;
    UITextField *addRecordTextField;
    UIAlertView *chooseRecordDestinationAlertView;
    NSIndexSet *setAnimation;
    
}

@property (nonatomic, strong) UITableView *tableView;

@end
