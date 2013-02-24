//
//  O2Cell.m
//  Oska2
//
//  Created by Neru on 19/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import "O2Cell.h"
#import "FirstViewController.h"

@implementation O2Cell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {      
        FirstViewController *firstViewController = [[FirstViewController alloc] init];

        
        self.backgroundColor = [UIColor blueColor];
        
        UILabel *myOwnCellMainLabel;
//        UILabel *myOwnCellDetailLabel;
//        UIImageView *myOwnCellLeftImageView;
//        UIImageView *myOwnCellRightImageView;
        
//        _cellLabel = [[UILabel alloc] init];
//        [_cellLabel setText:text];
//        [_cellLabel setBackgroundColor:[UIColor clearColor]];
//        [self.contentView addSubview:_cellLabel];

        
//        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
//        cell.backgroundColor = [UIColor yellowColor];
        
//        myOwnCellMainLabel = [[UILabel alloc] initWithFrame:CGRectMake(30.0f ,5.0f, CGRectGetWidth(firstViewController.tableView.frame)-30.0f, 15.0f)];
        myOwnCellMainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 200, 30)];
        myOwnCellMainLabel.backgroundColor = [UIColor redColor];
        myOwnCellMainLabel.textColor = [UIColor blueColor];
        myOwnCellMainLabel.textAlignment = NSTextAlignmentLeft;
        myOwnCellMainLabel.font = [UIFont systemFontOfSize:15.0f];
        myOwnCellMainLabel.tag = 101;
//        myOwnCellMainLabel.text = [cellDataOfFruitsTableArray objectAtIndex:firstViewController.tableView.indexPathsForVisibleRows];
//
//        myOwnCellDetailLabel = [[UILabel alloc] initWithFrame:CGRectMake(100.0f ,22.5f, CGRectGetWidth(firstViewController.tableView.frame)-30.0f, 10.0f)];
//        myOwnCellDetailLabel.backgroundColor = [UIColor clearColor];
//        myOwnCellDetailLabel.textColor = [UIColor brownColor];
//        myOwnCellDetailLabel.textAlignment = NSTextAlignmentLeft;
//        myOwnCellDetailLabel.font = [UIFont systemFontOfSize:10.0f];
//        myOwnCellDetailLabel.tag = 102;
//        
//        myOwnCellLeftImageView = [[UIImageView alloc] initWithFrame: CGRectMake(10.0f ,7.5f, 12.0f, 12.0f)];
//        myOwnCellLeftImageView.image = [UIImage imageNamed:@"black rectangle"];
//        myOwnCellLeftImageView.tag = 103;
//        
//        myOwnCellRightImageView = [[UIImageView alloc] initWithFrame: CGRectMake(200.0f ,5.0f, 32.0f, 32.0f)];
//        myOwnCellRightImageView.tag = 104;
//        
        [self.contentView addSubview:myOwnCellMainLabel];
//        [_cell.contentView addSubview:myOwnCellDetailLabel];
//        [_cell.contentView addSubview:myOwnCellLeftImageView];
//        [_cell.contentView addSubview:myOwnCellRightImageView];
//    
//    
        myOwnCellMainLabel = (UILabel *)[self.contentView viewWithTag:101];
//        myOwnCellDetailLabel = (UILabel *)[_cell.contentView viewWithTag:102];
//        myOwnCellLeftImageView = (UIImageView *)[_cell.contentView viewWithTag:103];
//        myOwnCellRightImageView = (UIImageView *)[_cell.contentView viewWithTag:104];
//    
//        [myOwnCellMainLabel setText:@"bsakldh"];
//        switch (firstViewController.tableView.sel)
        {
//            case 0:
                
//                myOwnCellMainLabel.text = [dataOfFruitsTableArray objectAtIndex:indexPath.row];
//                myOwnCellDetailLabel.text = newDateString;
//                myOwnCellRightImageView.image = [dataOfTableViewCellPicturesArray objectAtIndex:indexPath.row];
//                break;
//            case 1:
//                cell.textLabel.text = [dataOfVegetablesTableArray objectAtIndex:indexPath.row];
//                cell.detailTextLabel.text = [dataOfVegetablesTableArray objectAtIndex:indexPath.row];
//                break;
//            default:
//                break;
        }
            self.showsReorderControl = YES;
    }
    
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_cellLabel setFrame:CGRectMake(CGRectGetMinX(self.contentView.frame), 0, 100, 20)];
    
    // set frames
}

@end
