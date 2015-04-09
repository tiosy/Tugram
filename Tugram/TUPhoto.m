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

@implementation TUPhoto

@dynamic imagePFFile;
@dynamic thumbnailImageNSData;
@dynamic comments;
@dynamic likedBy;
@dynamic uploadedBy;


+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"TUPhoto";
}

-(void) AddPhoto:(UIImage *) image{

    if(self)
    {
        self.username   =   username;
        self.fullName   =   fullname;

        //UIImage ->  to Thumbnail -> NSData -> PFFile
        UIImage *imageThumbnail = [TYUtility imageWithImage:userProfileImage scaledToSize:CGSizeMake(30.0, 30.0)];
        NSData *imageNSData = UIImagePNGRepresentation(imageThumbnail);
        PFFile *imagePFFile = [PFFile fileWithName:self.objectId data:imageNSData]; //use uniqe objectId as
        self.profileThumbnailPFFile = imagePFFile;
        
    }

}









@end


//save image to Parse

//NSData *imageData = UIImagePNGRepresentation(image);
//PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];
//
//PFObject *userPhoto = [PFObject objectWithClassName:@"UserPhoto"];
//userPhoto[@"imageName"] = @"My trip to Hawaii!";
//userPhoto[@"imageFile"] = imageFile;
//[userPhoto saveInBackground];




//retrieve image from Parse
//PFFile *userImageFile = anotherPhoto[@"imageFile"];
//[userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
//    if (!error) {
//        UIImage *image = [UIImage imageWithData:imageData];
//    }
//}];





