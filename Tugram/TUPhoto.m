//
//  TUPhoto.m
//  Tugram
//
//  Created by tim on 4/7/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "TUPhoto.h"
// Import this header to let Armor know that PFObject privately provides most
// of the methods for PFSubclassing.
#import <Parse/PFObject+Subclass.h>

#import "TUUser.h"
#import "TUComment.h"
#import "TYUtility.h"


@implementation TUPhoto
@dynamic pid;
@dynamic imagePFFile;
@dynamic imageThumbnailNSData;
@dynamic comments;
@dynamic likedBy;
@dynamic uploadedBy;


+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"TUPhoto";
}

-(void) addPhoto:(UIImage *) imageUIImage uid: (NSString *) uid{


    if(self)
    {
        self.pid = self.objectId; //NSString

        //UIImage -> NSData -> PFFile
        NSData *imageNSData = UIImagePNGRepresentation(imageUIImage);
        PFFile *imagePFFile = [PFFile fileWithName:self.objectId data:imageNSData]; //use uniqe objectId as file name
        self.imagePFFile = imagePFFile;
        //UIImage ->  to Thumbnail -> NSData -> PFFile
        UIImage *imageThumbnail = [TYUtility imageWithImage:imageUIImage scaledToSize:CGSizeMake(60.0, 60.0)];
        NSData *imageThumbnailNSData = UIImagePNGRepresentation(imageThumbnail);
        self.imageThumbnailNSData = imageThumbnailNSData;

        self.uploadedBy = uid;

        [self saveInBackground];
    }

}


-(void) likePhoto:(NSString *) uid{

    //self is the TUPhoto

    [self addUniqueObject:uid forKey:@"likedBy"];
    [self saveInBackground];

    //retrieve the TUUser who likes this TUPhoto
    PFQuery *query = [TUUser query];
    [query whereKey:@"uid" equalTo:uid];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.

            //retrieve the TUPhoto
            TUUser *tuuser = [objects firstObject];
            [tuuser addUniqueObject:self.pid forKey:@"likes"];
            [tuuser saveInBackground];

        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}


-(void) commentPhoto: (NSString *) uid comment:(NSString *) comment{

    //self is the TUPhoto

    [self addUniqueObject:uid forKey:@"comments"];
    [self saveInBackground];

    //adding a comment to TUComment  //i know i know...just add here instead
    TUComment *tucomment = [TUComment object];
    tucomment.uid = uid;
    tucomment.pid = self.pid;
    tucomment.pid = self.objectId;
    tucomment.text = comment;

    [tucomment saveInBackground];


}











@end







