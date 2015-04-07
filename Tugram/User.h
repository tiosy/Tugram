//
//  User.h
//  ParseStarterProject
//
//  Created by Justin Haar on 4/7/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comment, Follower, Following, Like, Likedphoto, Photo;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSData * profileimage;
@property (nonatomic, retain) NSSet *comments;
@property (nonatomic, retain) NSSet *followers;
@property (nonatomic, retain) NSSet *followings;
@property (nonatomic, retain) NSSet *likedphotos;
@property (nonatomic, retain) NSSet *likes;
@property (nonatomic, retain) NSSet *photos;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(Comment *)value;
- (void)removeCommentsObject:(Comment *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

- (void)addFollowersObject:(Follower *)value;
- (void)removeFollowersObject:(Follower *)value;
- (void)addFollowers:(NSSet *)values;
- (void)removeFollowers:(NSSet *)values;

- (void)addFollowingsObject:(Following *)value;
- (void)removeFollowingsObject:(Following *)value;
- (void)addFollowings:(NSSet *)values;
- (void)removeFollowings:(NSSet *)values;

- (void)addLikedphotosObject:(Likedphoto *)value;
- (void)removeLikedphotosObject:(Likedphoto *)value;
- (void)addLikedphotos:(NSSet *)values;
- (void)removeLikedphotos:(NSSet *)values;

- (void)addLikesObject:(Like *)value;
- (void)removeLikesObject:(Like *)value;
- (void)addLikes:(NSSet *)values;
- (void)removeLikes:(NSSet *)values;

- (void)addPhotosObject:(Photo *)value;
- (void)removePhotosObject:(Photo *)value;
- (void)addPhotos:(NSSet *)values;
- (void)removePhotos:(NSSet *)values;

@end
