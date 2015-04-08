//
//  TUPhoto.h
//  Tugram
//
//  Created by tim on 4/7/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import <Parse/Parse.h>

@class TUPFUser;


@interface TUPhoto : PFObject<PFSubclassing>

//PFUser has email, username, password
@property (nonatomic, strong) PFFile *image;
@property (nonatomic, strong) NSData *thumbnailImage;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, strong) NSArray *likedBy;
@property (nonatomic, strong) TUPFUser *uploadedBy;

+ (NSString *)parseClassName;

@end
