//
//  CustomNavigationController.m
//  Oska2
//
//  Created by Neru on 25/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

- (id)init
{
    self = [super init];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
	if([[self.viewControllers lastObject] class] == [AddItemViewController class])
    {
        
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration: 1.00];
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown
                               forView:self.view cache:NO];
        
		UIViewController *viewController = [super popViewControllerAnimated:NO];
        
		[UIView commitAnimations];
        
		return viewController;
	}
    else
    {
		return [super popViewControllerAnimated:animated];
	}
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