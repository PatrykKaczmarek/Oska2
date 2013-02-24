//
//  O2Cell.h
//  Oska2
//
//  Created by Neru on 19/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface O2Cell : UITableViewCell
{
    // zmienne tylko do rwx w O2Cell
}

// zmienne, do których ma dostęp każda klasa, która ma dostęp do stworzonego obiektu typu O2Cell

@property (strong, nonatomic) UILabel *cellLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


@end
;