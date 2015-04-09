//
//  TUUser.h
//  Tugram
//
//  Created by tim on 4/8/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import <Parse/Parse.h>



//subclass of PFObject
@interface TUUser : PFObject<PFSubclassing>

//PFUser has email, username, password
@property (nonatomic,strong)  NSNumber *uid;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) PFFile *profileThumbnailPFFile;

@property (nonatomic, strong) NSArray *followers;
@property (nonatomic, strong) NSArray *followings;
@property (nonatomic, strong) NSArray *likes;

+ (NSString *)parseClassName;



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
