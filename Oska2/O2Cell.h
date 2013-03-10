//
//  O2Cell.h
//  Oska2
//
//  Created by Neru on 19/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "O2Constants.h"

// ================================================================================
//Declarations:
// ================================================================================
@interface O2Cell : UITableViewCell
{
    // o zasięgu klasowym
}
// --------------------------------------------------------------------------------
// o zasięgu globalnym
@property (nonatomic, strong) UILabel *mainLabel;
@property (nonatomic, strong) UILabel *detailLabelPrice;
@property (nonatomic, strong) UILabel *detailLabelAmount;
@property (nonatomic, strong) UILabel *detailLabelNamePrice;
@property (nonatomic, strong) UILabel *detailLabelNameAmount;
@property (nonatomic, strong) UIImageView *o2ImageView;
// --------------------------------------------------------------------------------
//tak sie przekazuje wlasne metody miedzy klasami:
//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title;

@end


