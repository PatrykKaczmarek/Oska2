//
//  FirstDetailViewController.m
//  Oska2
//
//  Created by Neru on 25/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "FirstDetailViewController.h"

@interface FirstDetailViewController ()

@end

@implementation FirstDetailViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        [self setTitle:NSLocalizedString(@"Details", nil)];
        [self.view setBackgroundColor:[UIColor yellowColor]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
