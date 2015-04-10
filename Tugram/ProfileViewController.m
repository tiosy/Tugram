//
//  ProfileViewController.m
//  Tugram
//
//  Created by Justin Haar on 4/7/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "ProfileViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "TUPFUser.h"
#import "TUUser.h"


@interface ProfileViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate, UIGestureRecognizerDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tapGesture = [UITapGestureRecognizer new];
    self.tapGesture.delegate = self;
    self.tapGesture.enabled = YES;
    [self.profilePicture setUserInteractionEnabled:YES];


    TUPFUser *currentUser = [TUPFUser currentUser];
    TUUser *user = [[TUUser alloc]initWith:currentUser.username fullname:currentUser.fullName userProfileImage:self.profilePicture.image];

    self.nameLabel.text = user.fullName;
    self.title = user.username;
//    self.profilePicture.image = user.profileThumnailNSData;

}


- (IBAction)tapGesture:(UITapGestureRecognizer *)sender
{
    [self showAlert];
}

- (IBAction)followersButton:(UIButton *)sender
{

}


- (IBAction)followingButton:(UIButton *)sender
{

}


- (IBAction)editProfileButton:(UIButton *)sender
{

}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //implement uploaded photos.count
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    //implement a users uploaded photos to display photos
    return cell;
    
}





#pragma MARK - EDIT PROFILE PICTURE


-(void)showAlert
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Choose Image" message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Take Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                              {
                                  [self showCamera];
                              }];

    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Choose From Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self showLibrary];
    }];

    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
        [self performSegueWithIdentifier:@"home" sender:self];
    }];

    [alertController addAction:action1];
    [alertController addAction:action2];
    [alertController addAction:action3];

    [self presentViewController:alertController animated:YES completion:nil];
}


-(void)showCamera
{

    UIImagePickerController *imagePicker = [UIImagePickerController new];

    if (UIImagePickerControllerSourceTypeCamera)
    {
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage, (NSString *) kUTTypeMovie];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}


-(void)showLibrary
{
    UIImagePickerController *imagePicker = [UIImagePickerController new];

    if (!UIImagePickerControllerSourceTypePhotoLibrary)
    {
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage, (NSString *) kUTTypeMovie];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];

    if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
    {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];

//        NSData *imageNSData = [self.selectedLost valueForKey:@"photo"];
//        self.imageview.image = [UIImage imageWithData:imageNSData];

        self.profilePicture.image = image;

        [self.profilePicture setAutoresizingMask:(UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth)];

    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaType);
    }

    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)image:(UIImage *)image finishedSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image/video"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}


@end
