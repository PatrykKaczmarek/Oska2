//
//  DetailViewController.m
//  Oska2
//
//  Created by Neru on 22/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize selectedCountryString;

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        [self setTitle:@"Country"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    selectedCountryLabel = [[UILabel alloc] initWithFrame:CGRectMake( CGRectGetMaxX(self.view.frame)*0.2, CGRectGetMaxY(self.view.frame)*0.4, 200, 40)];
//    [selectedCountryLabel setBackgroundColor:[UIColor redColor]];
//    [selectedCountryLabel setText:selectedCountryString];
//    [self.view addSubview:selectedCountryLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
