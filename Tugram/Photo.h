//
//  Photo.h
//  ParseStarterProject
//
//  Created by Justin Haar on 4/7/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comment, Like, User;

@interface Photo : NSManagedObject

@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) NSSet *comments;
@property (nonatomic, retain) NSSet *likes;
@property (nonatomic, retain) User *user;
@end

@interface Photo (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(Comment *)value;
- (void)removeCommentsObject:(Comment *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

- (void)addLikesObject:(Like *)value;
- (void)removeLikesObject:(Like *)value;
- (void)addLikes:(NSSet *)values;
- (void)removeLikes:(NSSet *)values;

@end
