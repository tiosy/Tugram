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



//+ (NSString *)parseClassName {
//    return @"TUPFUser";
//}

@end


//saving object to Parse
//PFObject *gameScore = [PFObject objectWithClassName:@"GameScore"];
//gameScore[@"score"] = @1337;
//gameScore[@"playerName"] = @"Sean Plott";
//gameScore[@"cheatMode"] = @NO;
//[gameScore saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//    if (succeeded) {
//        // The object has been saved.
//    } else {
//        // There was a problem, check error.description
//    }
//}];


//saving array for key
//[gameScore addUniqueObjectsFromArray:@[@"flying", @"kungfu"] forKey:@"skills"];
//[gameScore saveInBackground];


//NSString *objectId = gameScore.objectId;
//NSDate *updatedAt = gameScore.updatedAt;
//NSDate *createdAt = gameScore.createdAt;


//PFUser *user = [PFUser currentUser];
//PFRelation *relation = [user relationForKey:@"likes"];
//[relation addObject:post];
//[user saveInBackground];

//[[relation query] findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//    if (error) {
//        // There was an error
//    } else {
//        // objects has all the Posts the current user liked.
//    }
//}];

//
//QUERY
//PFQuery *query = [PFQuery queryWithClassName:@"GameScore"];
//[query whereKey:@"playerName" equalTo:@"Dan Stemkoski"];
//[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//    if (!error) {
//        // The find succeeded.
//        NSLog(@"Successfully retrieved %d scores.", objects.count);
//        // Do something with the found objects
//        for (PFObject *object in objects) {
//            NSLog(@"%@", object.objectId);
//        }
//    } else {
//        // Log details of the failure
//        NSLog(@"Error: %@ %@", error, [error userInfo]);
//    }
//}];


//NSPredicate *predicate = [NSPredicate predicateWithFormat:
//                          @"playerName = 'Dan Stemkosk'"];
//PFQuery *query = [PFQuery queryWithClassName:@"GameScore" predicate:predicate];
//


//relational queries

//// Assume PFObject *myPost was previously created.
//PFQuery *query = [PFQuery queryWithClassName:@"Comment"];
//[query whereKey:@"post" equalTo:myPost];
//
//[query findObjectsInBackgroundWithBlock:^(NSArray *comments, NSError *error) {
//    // comments now contains the comments for myPost
//}];
//



// inner query

//PFQuery *innerQuery = [PFQuery queryWithClassName:@"Post"];
//[innerQuery whereKeyExists:@"image"];
//PFQuery *query = [PFQuery queryWithClassName:@"Comment"];

//[query whereKey:@"post" matchesQuery:innerQuery];

//[query findObjectsInBackgroundWithBlock:^(NSArray *comments, NSError *error) {
//    // comments now contains the comments for posts with images
//}];



