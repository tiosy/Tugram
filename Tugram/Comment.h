//
//  Comment.h
//  ParseStarterProject
//
//  Created by Justin Haar on 4/7/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Photo, User;

@interface Comment : NSManagedObject

@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) Photo *photo;
@property (nonatomic, retain) User *user;

@end
