//
//  main.m
//  Oska2
//
//  Created by Neru on 15/02/2013.
//  Copyright (c) 2013 Neru. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "O2AppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        int retVal;
        @try {
            retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([O2AppDelegate class]));
        }
        @catch (NSException *exception) {
            NSLog(@"%@", [exception callStackSymbols]);
            @throw exception;
        }
        return retVal;
    }
}
