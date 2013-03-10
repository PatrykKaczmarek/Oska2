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
// ================================================================================
@implementation CustomNavigationController

// --------------------------------------------------------------------------------
- (id)init
{
    self = [super init];
    if (self)
    {
        // Custom initialization
    }
    return self;
}
// ================================================================================
#pragma mark - View lifecycle
// ================================================================================

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UINavigationBar appearance] setTintColor:[UIColor brownColor]];
    [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithRed:0.325 green:0.09 blue:0.09 alpha:1.0]];
    [[UITabBar appearance] setTintColor:[UIColor brownColor]];
    [[UIToolbar appearance] setTintColor:[UIColor brownColor]];
//    [[UIPickerView appearance] setBackgroundColor:[UIColor brownColor]];
    
    
}
// --------------------------------------------------------------------------------

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// ================================================================================
#pragma mark - UINavigation actions
// ================================================================================
- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
	if([[self.viewControllers lastObject] class] == [AddItemViewController class])
    {
        
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration: 1.00];
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
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

// --------------------------------------------------------------------------------
@end