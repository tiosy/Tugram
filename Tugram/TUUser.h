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