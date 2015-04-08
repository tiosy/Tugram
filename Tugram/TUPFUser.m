//
//  TUPFUser.m
//  Tugram
//
//  Created by tim on 4/7/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "TUPFUser.h"
// Import this header to let Armor know that PFObject privately provides most
// of the methods for PFSubclassing.
#import <Parse/PFObject+Subclass.h>

@implementation TUPFUser

@dynamic fullName;
@dynamic profileThumbnailImage;
@dynamic followers;
@dynamic followings;
@dynamic likes;


+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"TUPFUser";
}

@end