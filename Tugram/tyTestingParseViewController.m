//
//  tyTestingParseViewController.m
//  Tugram
//
//  Created by tim on 4/9/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "tyTestingParseViewController.h"


//Parse files
#import <Parse/Parse.h>
#import "TUPFUser.h"
#import "TUUser.h"
#import "TUPhoto.h"
#import "TUComment.h"





@interface tyTestingParseViewController () 

@property (weak, nonatomic) IBOutlet UILabel *labelFullName;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *labelEmail;

@property NSMutableArray *pictures;
@property NSMutableDictionary *dic;


@end

@implementation tyTestingParseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//
//    TUUser *usr = [TUUser object];
//    [usr addUser:usr username:@"jeremy" fullname: @"lin"];
//
//
//    NSLog(@"%@",usr);
//UIImage *img = [UIImage imageNamed:@"person"];
//    [TUUser addUserProfileImage:@"jeremy" userProfileImage:img];

//    TUUser *usr;
//    UIImage *img;
//
//    usr = [TUUser object];
//    [usr addUser:usr username:@"tim" fullname: @"yeh"];
//    img = [UIImage imageNamed:@"person"];
//    [TUPhoto addPhoto:img username:@"tim"];
//
//    usr = [TUUser object];
//    [usr addUser:usr username:@"john" fullname: @"yeh"];
//    img = [UIImage imageNamed:@"person"];
//    [TUPhoto addPhoto:img username:@"john"];
//
//
//    usr = [TUUser object];
//    [usr addUser:usr username:@"mary" fullname: @"yeh"];
//    img = [UIImage imageNamed:@"person"];
//    [TUPhoto addPhoto:img username:@"mary"];
//    

    [self retrieveTUPhoto];





    //
    //    default test: ADD dummy object to Parse
    //

    //    PFObject *testObject = [PFObject objectWithClassName:@"TestObject2"];
    //    testObject[@"foo22"] = @"bar23";
    //    [testObject saveInBackground];





    //  TESTING SUBCLASS PFUSER ...ADD to Parse: create User
    //    [self testAddPFUser];

    //  ADD to Parse: create User
    //    [self testAddTUUser];
    //


//    // update object/image to Parse
//    [self testUpdateTUUserObjectImage];
//    
//    
//    // Retrieve object/image from Parse
//    [self testRetrieveTUUser];





}








////  TESTING SUBCLASS PFUSER ...ADD to Parse: create User
-(void) testAddPFUser{

    TUPFUser *user = [TUPFUser object];
    user.username = @"onedirection";
    user.fullName = @"One Direction";
    UIImage *image = [UIImage imageNamed:@"person"];
    NSData *imageData = UIImagePNGRepresentation(image);
    user.profileThumbnailImage = imageData;

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {

    }];


}


//  ADD to Parse: create TUUser
-(void) testAddTUUser{

    TUUser *user = [TUUser object];
    user.username = @"jackson";
    user.fullName = @"michael Jackson";

    UIImage *image = [UIImage imageNamed:@"person"];
    NSData *imageData = UIImagePNGRepresentation(image);

    PFFile *imagePFFile = [PFFile fileWithName:@"person.png" data:imageData];

    user.profileThumbnailPFFile = imagePFFile;

    [user saveInBackground];

}

// add image to TUPhoto
-(void) testAddImageTUPhoto
{
    //use PFUser currentuser
    TUPFUser *user = [TUPFUser object];
    //user.currentUser

    TUPhoto *photo = [TUPhoto object];

    photo.uploadedBy = user.objectId;


    UIImage *image = [UIImage imageNamed:@"person"];
    NSData *imageData = UIImagePNGRepresentation(image);

    PFFile *imagePFFile = [PFFile fileWithName:@"person.png" data:imageData];
    photo.imagePFFile = imagePFFile;


    [photo saveInBackground];


}

// update object/image to Parse
-(void) testUpdateTUUserObjectImage
{
    PFQuery *query = [TUUser query];
    [query whereKey:@"username" equalTo:@"jackson"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.

            TUUser *user = [objects firstObject];

            //now updating

            UIImage *image = [UIImage imageNamed:@"person"];
            NSData *imageData = UIImagePNGRepresentation(image);
            PFFile *imageFile = [PFFile fileWithName:@"person.png" data:imageData];

            user.profileThumbnailPFFile = imageFile;

            [user saveInBackground];

            //add to TUPhoto

        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

//  retrieve object & image from Parse
-(void) testRetrieveTUUser{

    PFQuery *query = [TUUser query];
    [query whereKey:@"username" equalTo:@"jackson"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.

            TUUser *user = [objects firstObject];
            self.labelFullName.text = user.fullName;


            //retrieving image from Parse

            PFFile *userPFile = user.profileThumbnailPFFile;
            [userPFile getDataInBackgroundWithBlock:^(NSData *imageNSData, NSError *error) {
                NSLog(@"=from parse error=====%@",error);

                if (!error) {
                    UIImage *img = [UIImage imageWithData:imageNSData];

                    NSLog(@"=from parse img=====%@",img);
                    self.imageview.image = img;
                }


            }];

        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}


//
-(void) retrieveTUPhoto{

    PFQuery *query = [TUPhoto query];
    //[query whereKey:@"username" equalTo:username];
    [query orderByDescending:@"createdAt"];
    NSArray *objects = [query findObjects];
    for (TUPhoto *tuphoto in objects) {
        
        //retrieving image from Parse
        PFFile *imagePFile = tuphoto.imagePFFile;
        [imagePFile getDataInBackgroundWithBlock:^(NSData *imageNSData, NSError *error) {
                if (!error) {
                    UIImage *img = [UIImage imageWithData:imageNSData];

                    self.dic = [NSMutableDictionary new];

                    [self.dic  setObject:img forKey:@"picture"];
                    [self.dic  setObject:tuphoto.uploadedBy forKey:@"username"];
                    [self.dic  setObject:tuphoto.createdAt forKey:@"time"];
                    NSString  *numlikes = [NSString stringWithFormat:@"%ld", tuphoto.likedBy.count];
                    [self.dic  setObject:numlikes forKey:@"numLikes"];
                    [self.dic setObject:tuphoto.comments forKey:@"comments"];

                    [self.pictures addObject:self.dic];

                    NSLog(@"===%ld",self.pictures.count);
                }
            
            
        }];

        
    }







//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (!error) {
//            // The find succeeded.
//
//            for (TUPhoto *tuphoto in objects) {
//
//                //retrieving image from Parse
//                PFFile *imagePFile = tuphoto.imagePFFile;
//                [imagePFile getDataInBackgroundWithBlock:^(NSData *imageNSData, NSError *error) {
//                        if (!error) {
//                            UIImage *img = [UIImage imageWithData:imageNSData];
//
//                            self.dic = [NSMutableDictionary new];
//
//                            [self.dic  setObject:img forKey:@"picture"];
//                            [self.dic  setObject:tuphoto.uploadedBy forKey:@"username"];
//                            [self.dic  setObject:tuphoto.createdAt forKey:@"time"];
//                            NSString  *numlikes = [NSString stringWithFormat:@"%ld", tuphoto.likedBy.count];
//                            [self.dic  setObject:numlikes forKey:@"numLikes"];
//                            [self.dic setObject:tuphoto.comments forKey:@"comments"];
//
//                            [self.pictures addObject:self.dic];
//
//                            NSLog(@"===%ld",self.pictures.count);
//                        }
//                    
//                    
//                }];
//
//
//            }
//
//
//        } else {
//            // Log details of the failure
//            NSLog(@"Error: %@ %@", error, [error userInfo]);
//        }
//    }];






}

//













@end
