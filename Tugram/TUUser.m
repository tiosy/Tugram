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

@dynamic username;
@dynamic fullName;
@dynamic profileThumbnailPFFile;
@dynamic followers;
@dynamic followings;
@dynamic likes;

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"TUUser";
}

//init a user for UI
-(instancetype) initWith:(NSString *)username fullname:(NSString *) fullname userProfileImage: (UIImage *) userProfileImage{

    self =[super init];

    if(self)
    {
        self.username   =   username;
        self.fullName   =   fullname;

        //UIImage ->  to Thumbnail -> NSData -> PFFile
        UIImage *imageThumbnail = [TYUtility imageWithImage:userProfileImage scaledToSize:CGSizeMake(30.0, 30.0)];
        NSData *imageNSData = UIImagePNGRepresentation(imageThumbnail);
        PFFile *imagePFFile = [PFFile fileWithName:self.objectId data:imageNSData]; //use uniqe objectId as filename
        self.profileThumnailNSData = imageNSData;
        self.profileThumbnailPFFile = imagePFFile;

    }

    return self;
}








@end