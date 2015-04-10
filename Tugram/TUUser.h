//
//  TUUser.h
//  Tugram
//
//  Created by tim on 4/8/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//


//This Class is mainly used for UI...TUPFUser takes care of signup/login jobs
#import <Parse/Parse.h>
//subclass of PFObject
@interface TUUser : PFObject<PFSubclassing>

//PFUser has email, username, password
@property (nonatomic,strong)  NSString *uid;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) PFFile *profileThumbnailPFFile;
@property (nonatomic, strong) NSData *profileThumbnailNSData;

@property (nonatomic, strong) NSArray *followers; //contains NSString *uid
@property (nonatomic, strong) NSArray *followings; //contains NSString *uid
@property (nonatomic, strong) NSArray *likes; //contains NSString *pid

+ (NSString *)parseClassName;


//add a user
-(void) addUser:(TUUser *) user  username:(NSString *)username fullname:(NSString *) fullname;

//add user profile image
+(void) addUserProfileImage:(NSString *)username userProfileImage: (UIImage *) userProfileImage;

-(void) addFollowing: (NSString *) currentUID followingUID:(NSString *) uid;

@end


