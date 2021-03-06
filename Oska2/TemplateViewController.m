//
//  TemplateViewController.m
//  Oska2
//
//  Created by Neru on 06/03/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "TemplateViewController.h"

@interface TemplateViewController ()

@end

// ================================================================================
@implementation TemplateViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        [self setTitle:NSLocalizedString(@"Template images", nil)];
        [self.view setBackgroundColor:[UIColor yellowColor]];
        
    }
    return self;
}

// --------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Cancel", nil) style:UIBarButtonItemStyleBordered target:self.navigationController action:@selector(popViewControllerAnimated:)];
    
	_scrollView = [[UIScrollView alloc] init];
    _templatePicturesArray = @[@"noimage", @"acorn_squash", @"apple", @"banana", @"bell_pepper", @"blueberries", @"broccoli", @"carrot", @"celery", @"chili_pepper", @"eggplant", @"grape", @"lettuce", @"mushroom", @"onion", @"orange", @"papaya", @"pineapple", @"potato", @"pumpkin", @"radish", @"squash", @"strawberry", @"sugar_snap", @"tomato", @"watermelon", @"cucumber"];
    [self.view addSubview:_scrollView];  
}

// --------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// --------------------------------------------------------------------------------
-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [[_scrollView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];

    int row = 0;
    int column = 0;
    float verticalMargin = 20.0f;
    CGSize buttonWithPictureSize = CGSizeMake(40.0f, 40.0f);
    float amountOfColumn = floorf(CGRectGetWidth(self.view.frame)/(buttonWithPictureSize.width + 20.0f));
    float horizontalSpace = (CGRectGetWidth(self.view.frame) - amountOfColumn * buttonWithPictureSize.width)/amountOfColumn;
    float horizontalMargin = horizontalSpace/2;
    
    for (int i = 0; i < _templatePicturesArray.count; i++)
    {
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[_templatePicturesArray objectAtIndex:i] ofType:@"png"]];
        //        UIImage *image = [UIImage imageNamed:[_templatePicturesArray objectAtIndex:i]];
        _buttonWithPicture = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonWithPicture setBackgroundColor:[UIColor redColor]];
        [_buttonWithPicture setBackgroundImage:image forState:UIControlStateNormal];
        [_buttonWithPicture addTarget:self
                               action:@selector(ButtonClicked:)
                     forControlEvents:UIControlEventTouchUpInside];
        
        [_buttonWithPicture setFrame:CGRectMake(column*buttonWithPictureSize.width + horizontalMargin + column*horizontalSpace,
                                                row*(verticalMargin + buttonWithPictureSize.height) + verticalMargin,
                                                buttonWithPictureSize.width,
                                                buttonWithPictureSize.height)];
        [_buttonWithPicture setTag:i];
        [_scrollView addSubview:_buttonWithPicture];
        
        if (column == floorf(CGRectGetWidth(self.view.frame)/(buttonWithPictureSize.width + 20.0f)) -1)
        {
            column = 0;
            row++;
        }
        else
        {
            column++;
        }
    }
    
    [_scrollView setFrame:CGRectMake(0.0f,
                                     0.0f,
                                     CGRectGetWidth(self.view.frame),
                                     CGRectGetHeight(self.view.frame))];
    
    [_scrollView setContentSize:CGSizeMake(CGRectGetWidth(self.view.frame),
                                           (row + 1) * (verticalMargin + buttonWithPictureSize.height) + verticalMargin)];
}

// --------------------------------------------------------------------------------
-(void)ButtonClicked:(id)sender
{
    NSLog(@"%d",_buttonWithPicture.tag);
}

// --------------------------------------------------------------------------------
@end
