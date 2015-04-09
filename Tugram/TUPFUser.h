//
//  TUPFUser.h
//  Tugram
//
//  Created by tim on 4/7/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//
#import <Parse/Parse.h>

//subclass of PFUser
@interface TUPFUser : PFUser<PFSubclassing>

//PFUser has email, username, password
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSData *profileThumbnailImage;
@property (nonatomic, strong) NSArray *followers;
@property (nonatomic, strong) NSArray *followings;
@property (nonatomic, strong) NSArray *likes;  //NSString *pid

//+ (NSString *)parseClassName;


@end

//[TUPFUser registerSubclass];
//[TUPFUser currentUser]; //return subclass


//PFObject *shield = [PFObject objectWithClassName:@"Armor"];
//shield[@"displayName"] = @"Wooden Shield";
//shield[@"fireProof"] = @NO;
//shield[@"rupees"] = @50;

//Armor *shield = [Armor object];
//shield.displayName = @"Wooden Shield";
//shield.fireProof = NO;
//shield.rupees = 50;


//query using subclass
//PFQuery *query = [Armor query];
//[query whereKey:@"rupees" lessThanOrEqualTo:[PFUser currentUser][@"rupees"]];
//[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//    if (!error) {
//        Armor *firstArmor = [objects firstObject];
//        // ...
//    }
//}];