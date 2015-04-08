//
//  ViewController.m
//  Tugram
//
//  Created by tim on 4/6/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

#import "TUUser.h"
#import "TUPhoto.h"
#import "TUComment.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelFullName;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *labelEmail;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//
//    default test: ADD dummy object to Parse
//

//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject2"];
//    testObject[@"foo22"] = @"bar23";
//    [testObject saveInBackground];

//*****************************************************************
////  ADD to Parse: create User
//*****************************************************************
//
//    TUUser *user = [TUUser object];
//    user.username = @"jackson";
//    user.fullName = @"michael Jackson";
//
//    UIImage *image = [UIImage imageNamed:@"person"];
//    NSData *imageData = UIImagePNGRepresentation(image);
//
//    PFFile *imagePFFile = [PFFile fileWithName:@"person.png" data:imageData];
//
//    user.profileThumbnailPFFile = imagePFFile;
//
//   [user saveInBackground];


// update object/image to Parse

//    PFQuery *query = [TUUser query];
//        [query whereKey:@"username" equalTo:@"jackson"];
//        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//            if (!error) {
//                // The find succeeded.
//    
//                TUUser *user = [objects firstObject];
//
//                //now updating
//                user.email = @"mjackson@google.com";
//                UIImage *image = [UIImage imageNamed:@"person"];
//                NSData *imageData = UIImagePNGRepresentation(image);
//                PFFile *imageFile = [PFFile fileWithName:@"person.png" data:imageData];
//                
//                user.profileThumbnailImage = imageFile;
//                
//                
//                [user saveInBackground];
//
//
//
//            } else {
//                // Log details of the failure
//                NSLog(@"Error: %@ %@", error, [error userInfo]);
//            }
//        }];
//



//***************************************************
//  retrieve object & image from Parse
//***************************************************

    PFQuery *query = [TUUser query];
    [query whereKey:@"username" equalTo:@"jackson"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.

            TUUser *user = [objects firstObject];
            self.labelFullName.text = user.fullName;
            self.labelEmail.text = user.email;


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



@end
