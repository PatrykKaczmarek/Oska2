//
//  FirstViewController.m
//  Oska2
//
//  Created by Neru on 15/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

/////////////////////////////////////////////////////////////////////////////////
- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"First";
    }
    return self;    
}


#pragma mark - View lifecycle

/////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [self.view addSubview:_tableView];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 0.0f, 50.0f)];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 10.0f, CGRectGetWidth(_tableView.frame) - 20.0f, CGRectGetHeight(headerView.frame) - 20.0f)];
    [headerLabel setText:@"MAIN HEADER"];
    [headerLabel setBackgroundColor:[UIColor clearColor]];
    [headerLabel setTextAlignment:NSTextAlignmentCenter];
    [headerView addSubview:headerLabel];
    [headerView setBackgroundColor:[UIColor redColor]];
    _tableView.tableHeaderView = headerView;
}

/////////////////////////////////////////////////////////////////////////////////
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [_tableView setFrame:self.view.frame];
}


#pragma mark - UITableView DataSource & Delegate

/////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

/////////////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 5;
        case 1:
            return 2;
        default:
            return 1;
    }
}

/////////////////////////////////////////////////////////////////////////////////
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    switch (indexPath.section) {
        case 0:
            [cell.textLabel setText:[NSString stringWithFormat:@"dane %d", indexPath.row + 1]];
            break;
        case 1:
            [cell.textLabel setText:[NSString stringWithFormat:@"noweDane %d", indexPath.row + 1]];
        default:
            break;
    }
    
    return cell;
}

/////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

/////////////////////////////////////////////////////////////////////////////////
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"You clicked me! Section:%d, row:%d", indexPath.section, indexPath.row);
}

/////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.0f;
}

/////////////////////////////////////////////////////////////////////////////////
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return [NSString stringWithFormat:@"Header %d", section + 1];
        case 1:
            return [NSString stringWithFormat:@"Header %d", section + 1];
        default:
            return @"";
    }
}

@end
