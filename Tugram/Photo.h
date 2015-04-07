//
//  Photo.h
//  Tugram
//
//  Created by tim on 4/7/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comment, User;

@interface Photo : NSManagedObject

@property (nonatomic, retain) NSDate * timestamp;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSData * thumbnail;
@property (nonatomic, retain) NSSet *comments;
@property (nonatomic, retain) NSSet *likedBy;
@property (nonatomic, retain) User *uploadedByUser;
@end

@interface Photo (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(Comment *)value;
- (void)removeCommentsObject:(Comment *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

- (void)addLikedByObject:(User *)value;
- (void)removeLikedByObject:(User *)value;
- (void)addLikedBy:(NSSet *)values;
- (void)removeLikedBy:(NSSet *)values;

@end
