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

-(void) AddTransaction: (NSString *) uid pid:(NSString *) pid type:(NSString *) type{

//    if(self)
//    {
//        self.xtranID = self.
//        [self saveInBackground];
//
//        //now write follower(aka currentUID) to uid
//        //retrieve the TUUser
//        PFQuery *query = [TUUser query];
//        [query whereKey:@"uid" equalTo:uid];
//        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//            if (!error) {
//                // The find succeeded.
//
//                //retrieve the TUPhoto
//                TUUser *tuuser = [objects firstObject];
//                [tuuser addUniqueObject:currentUID forKey:@"followers"];
//                [tuuser saveInBackground];
//
//            } else {
//                // Log details of the failure
//                NSLog(@"Error: %@ %@", error, [error userInfo]);
//            }
//        }];
//        
//        
//    }

    
}

@end
