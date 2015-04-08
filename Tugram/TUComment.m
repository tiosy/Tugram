//
//  TUComment.m
//  Tugram
//
//  Created by tim on 4/7/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "TUComment.h"
// Import this header to let Armor know that PFObject privately provides most
// of the methods for PFSubclassing.
#import <Parse/PFObject+Subclass.h>


@implementation TUComment


@dynamic text;
@dynamic forPhoto;
@dynamic byUser;

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"TUComment";
}

@end




