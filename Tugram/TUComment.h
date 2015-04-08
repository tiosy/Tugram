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

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) TUPhoto *forPhoto;
@property (nonatomic, strong) TUPFUser *byUser;

+ (NSString *)parseClassName;

@end
