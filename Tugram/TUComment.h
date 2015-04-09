//
//  TUComment.h
//  Tugram
//
//  Created by tim on 4/7/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import <Parse/Parse.h>

@class TUPFUser;
@class TUPhoto;

@interface TUComment : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *mid; //use self's objectId as comment id
@property (nonatomic, strong) NSString *text; // comment
@property (nonatomic, strong) NSString *pid; // photo id
@property (nonatomic, strong) NSString *uid; // user id

+ (NSString *)parseClassName;

@end
