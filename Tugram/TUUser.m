//
//  TUUser.m
//  Tugram
//
//  Created by tim on 4/8/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "TUUser.h"

// Import this header to let Armor know that PFObject privately provides most
// of the methods for PFSubclassing.
#import <Parse/PFObject+Subclass.h>
#import "TYUtility.h"

@implementation TUUser

@dynamic uid;
@dynamic username;
@dynamic fullName;
@dynamic profileThumbnailPFFile;
@dynamic profileThumbnailNSData;
@dynamic followers;
@dynamic followings;
@dynamic likes;

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"TUUser";
}



//add a user
-(void) addUser:(TUUser *) user  username:(NSString *)username fullname:(NSString *) fullname{

    //TUUser *user = [TUUser object];
    user.uid = user.objectId;
    user.username   =   username;
    user.fullName   =   fullname;

    [user saveInBackground];
}

//add user profile image
+(void) addUserProfileImage:(NSString *)username userProfileImage: (UIImage *) userProfileImage {

    //retrieve the TUUser first
    PFQuery *query = [TUUser query];
    [query whereKey:@"username" equalTo:username];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.

            //retrieve the TUUser
            TUUser *tuuser = [objects firstObject];

            NSLog(@"%@", tuuser.username);

            //UIImage ->  to Thumbnail -> NSData -> PFFile
            UIImage *imageThumbnail = [TYUtility imageWithImage:userProfileImage scaledToSize:CGSizeMake(30.0, 30.0)];
            NSData *imageNSData = UIImagePNGRepresentation(imageThumbnail);
            tuuser.profileThumbnailNSData = imageNSData;
            PFFile *imagePFFile = [PFFile fileWithName:tuuser.objectId data:imageNSData]; //use uniqe objectId as file name
            tuuser.profileThumbnailPFFile = imagePFFile;

            [tuuser saveInBackground];

        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

}







-(void) addFollowing: (NSString *) currentUID followingUID:(NSString *) uid{

    if(self)
    {
        [self addUniqueObject:uid forKey:@"followings"];
        [self saveInBackground];

        //now write follower(aka currentUID) to uid
        //retrieve the TUUser
        PFQuery *query = [TUUser query];
        [query whereKey:@"uid" equalTo:uid];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                // The find succeeded.

                //retrieve the TUPhoto
                TUUser *tuuser = [objects firstObject];
                [tuuser addUniqueObject:currentUID forKey:@"followers"];
                [tuuser saveInBackground];

                //add transaction




            } else {
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];


    }





}






@end