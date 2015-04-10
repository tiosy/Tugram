//
//  TUTransaction.m
//  Tugram
//
//  Created by tim on 4/9/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "TUTransaction.h"
// Import this header to let Armor know that PFObject privately provides most
// of the methods for PFSubclassing.
#import <Parse/PFObject+Subclass.h>

@implementation TUTransaction

@dynamic xtranID;
@dynamic uid;
@dynamic pid;
@dynamic type;

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"TUTransaction";
}

+(void) addTransaction: (NSString *) uid pid:(NSString *) pid type:(NSString *) type{

    TUTransaction *xtran = [TUTransaction object];
    xtran.xtranID = xtran.objectId;
    xtran.pid = pid;
    xtran.uid = uid;
    xtran.type = type;
    [xtran saveInBackground];

}





@end
