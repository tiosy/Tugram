//
//  TUPhoto.h
//  Tugram
//
//  Created by tim on 4/7/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import <Parse/Parse.h>

@interface TUPhoto : PFObject<PFSubclassing>

//PFUser has email, username, password
@property (nonatomic, strong) NSString *pid; //use TUPhoto's objectId 
@property (nonatomic, strong) PFFile *imagePFFile;
@property (nonatomic, strong) NSData *imageThumbnailNSData;
@property (nonatomic, strong) NSArray *comments; // mids
@property (nonatomic, strong) NSArray *likedBy; //uids
@property (nonatomic, strong) NSString *uploadedBy; //uid

+ (NSString *)parseClassName;

+(void) addPhoto:(UIImage *) imageUIImage username: (NSString *) username;
-(void) likePhoto: (NSString *) username;
-(void) commentPhoto: (NSString *) uid comment:(NSString *) comment;
@end
