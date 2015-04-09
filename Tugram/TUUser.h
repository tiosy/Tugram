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
@property (nonatomic, strong) NSData *profileThumnailNSData; //redundant but might improve performance

@property (nonatomic, strong) NSArray *followers; //contains NSString *uid
@property (nonatomic, strong) NSArray *followings; //contains NSString *uid
@property (nonatomic, strong) NSArray *likes; //contains NSString *pid

+ (NSString *)parseClassName;

-(instancetype) initWith:(NSString *)username fullname:(NSString *) fullname userProfileImage: (UIImage *) userProfileImage;

-(void) addFollowing: (NSString *) currentUID followingUID:(NSString *) uid;

@end



//Counters
//
//The above example contains a common use case. The "score" field is a counter that we'll need to continually update with the player's latest score. Using the above method works but it's cumbersome and can lead to problems if you have multiple clients trying to update the same counter.
//
//To help with storing counter-type data, Parse provides methods that atomically increment (or decrement) any number field. So, the same update can be rewritten as:
//
//[gameScore incrementKey:@"score"];
//[gameScore saveInBackground];
//
