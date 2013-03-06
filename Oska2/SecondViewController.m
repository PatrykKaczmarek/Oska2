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
    self.view.backgroundColor = [UIColor blueColor];
    
    _mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, CGRectGetWidth(self.view.frame) - 100, 35)];
    [_mainLabel setBackgroundColor:[UIColor yellowColor]];
    [_mainLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:_mainLabel];
}

/////////////////////////////////////////////////////////////////////////////////
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _mainTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateMainTimer:) userInfo:nil repeats:YES];
}

/////////////////////////////////////////////////////////////////////////////////
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [_mainTimer invalidate];
}

/////////////////////////////////////////////////////////////////////////////////
-(void)updateMainTimer:(id)sender
{
    NSDate *defaultDate = [[NSUserDefaults standardUserDefaults] objectForKey:O2_FIRST_RUN_KEY];
    NSDateComponents *compDate = [[NSCalendar currentCalendar] components:NSSecondCalendarUnit|NSMinuteCalendarUnit|NSHourCalendarUnit fromDate:defaultDate toDate:[NSDate date] options:0];
    
//    NSString *timeString = [NSDateFormatter localizedStringFromDate:defaultDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
    [_mainLabel setText:[NSString stringWithFormat:@"H:%i M:%i S:%i",compDate.hour, compDate.minute, compDate.second]];
}

@end
