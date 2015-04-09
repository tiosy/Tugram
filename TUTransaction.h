//
//  TUTransaction.h
//  Tugram
//
//  Created by tim on 4/9/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import <Parse/Parse.h>

@interface TUTransaction : PFObject<PFSubclassing>

@property NSString *xtranID;
@property NSString *uid; //user ID
@property NSString *pid; // picture ID
@property NSString *type;


+ (NSString *)parseClassName;

@end


//PFObject:
//createdAt
//updatedAt
//ObjectId