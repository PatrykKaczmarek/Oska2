//
//  SecondViewController.m
//  Oska2
//
//  Created by Neru on 15/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

/////////////////////////////////////////////////////////////////////////////////
- (id)init
{
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"Second", nil) ;
    }
    return self;
}

/////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad
{
    [super viewDidLoad];
}

/////////////////////////////////////////////////////////////////////////////////
- (void)viewWillAppear:(BOOL)animated {
    
}

/////////////////////////////////////////////////////////////////////////////////
- (void)viewDidDisappear:(BOOL)animated {

}

/////////////////////////////////////////////////////////////////////////////////
-(void)updateMainTimer:(id)sender
{
    NSDate *defaultDate = [[NSUserDefaults standardUserDefaults] objectForKey:O2_FIRST_RUN_KEY];
    NSDateComponents *compDate = [[NSCalendar currentCalendar] components:NSSecondCalendarUnit|NSMinuteCalendarUnit|NSHourCalendarUnit fromDate:defaultDate toDate:[NSDate date] options:0];

    [_mainLabel setText:[NSString stringWithFormat:@"H:%i M:%i S:%i",compDate.hour, compDate.minute, compDate.second]];
}

@end
