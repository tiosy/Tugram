//
//  Likedphoto.h
//  ParseStarterProject
//
//  Created by Justin Haar on 4/7/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Likedphoto : NSManagedObject

@property (nonatomic, retain) User *user;

@end
