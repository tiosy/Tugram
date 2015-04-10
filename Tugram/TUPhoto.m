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
#import "TUTransaction.h"
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

+(void) addPhoto:(UIImage *) imageUIImage username: (NSString *) username{


    TUPhoto *tuphoto = [TUPhoto object];
    tuphoto.pid = tuphoto.objectId; //NSString

    //UIImage -> NSData -> PFFile
    NSData *imageNSData = UIImagePNGRepresentation(imageUIImage);
    PFFile *imagePFFile = [PFFile fileWithName:tuphoto.objectId data:imageNSData]; //use uniqe objectId as file name
    tuphoto.imagePFFile = imagePFFile;
    //UIImage ->  to Thumbnail -> NSData -> PFFile
    UIImage *imageThumbnail = [TYUtility imageWithImage:imageUIImage scaledToSize:CGSizeMake(60.0, 60.0)];
    NSData *imageThumbnailNSData = UIImagePNGRepresentation(imageThumbnail);
    tuphoto.imageThumbnailNSData = imageThumbnailNSData;

    tuphoto.uploadedBy = username;

    [tuphoto saveInBackground];


    //add transaction
    [TUTransaction addTransaction:username pid:tuphoto.pid type:@"addPhoto"];




}

// ???
-(void) likePhoto:(NSString *) username{

    //self is the TUPhoto

    [self addUniqueObject:username forKey:@"likedBy"];
    [self saveInBackground];

    //retrieve the TUUser who likes this TUPhoto
    PFQuery *query = [TUUser query];
    [query whereKey:@"username" equalTo:username];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.

            //retrieve the TUPhoto
            TUUser *tuuser = [objects firstObject];
            [tuuser addUniqueObject:self.pid forKey:@"likes"];
            [tuuser saveInBackground];

            //add transaction




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

    //add transaction
}



+ (void)retrieveTUPhotoWithCompletion:(void (^)(NSArray *))complete
{
    PFQuery *query = [TUPhoto query];
    //[query whereKey:@"username" equalTo:username];
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.


            NSMutableArray *superPictures = [NSMutableArray arrayWithCapacity:objects.count];
            superPictures = [objects mutableCopy];
            complete(superPictures);

        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

@end





//for (TUPhoto *tuphoto in objects) {
//    NSMutableDictionary *dic = [NSMutableDictionary new];
//    [dic  setObject:tuphoto.pid forKey:@"pid"];
//    [dic  setObject:tuphoto.imagePFFile forKey:@"imagePFfile"];
//    [dic  setObject:tuphoto.imageThumbnailNSData   forKey:@"imageThumbnailNSData"];
//    [dic  setObject:tuphoto.comments forKey:@"comments"];
//    [dic  setObject:tuphoto.likedBy forKey:@"likedBy"];
//    NSString  *numlikes = [NSString stringWithFormat:@"%ld", tuphoto.likedBy.count];
//    [dic  setObject:numlikes forKey:@"numLikes"];
//    [dic  setObject:tuphoto.uploadedBy forKey:@"uploadedBy"];
//    [dic  setObject:tuphoto.createdAt forKey:@"createdAt"];
//
//
//    [superPictures addObject:dic];
//}

//NSMutableArray *pictures = [NSMutableArray new];
//for (TUPhoto *tuphoto in objects) {
//
//    //retrieving image from Parse
//    PFFile *imagePFile = tuphoto.imagePFFile;
//    [imagePFile getDataInBackgroundWithBlock:^(NSData *imageNSData, NSError *error) {
//        if (!error) {
//            UIImage *img = [UIImage imageWithData:imageNSData];
//
//            NSMutableDictionary *dic = [NSMutableDictionary new];
//
//            [dic  setObject:img forKey:@"picture"];
//            [dic  setObject:tuphoto.uploadedBy forKey:@"username"];
//            [dic  setObject:tuphoto.createdAt forKey:@"time"];
//            NSString  *numlikes = [NSString stringWithFormat:@"%ld", tuphoto.likedBy.count];
//            [dic  setObject:numlikes forKey:@"numLikes"];
//            [dic setObject:tuphoto.comments forKey:@"comments"];
//
//            [pictures addObject:dic];
//
//            NSLog(@"===%ld",pictures.count);
//        }
//    }];
//}
//
//complete(pictures);
//














