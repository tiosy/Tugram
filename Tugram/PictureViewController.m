//
//  PictureViewController.m
//  Tugram
//
//  Created by Justin Haar on 4/7/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "PictureViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "MainViewController.h"
#import "ImageCellTableViewCell.h"

#import "TUPFUser.h"
#import "TUUser.h"
#import "TUPhoto.h"
#import "TYUtility.h"


@interface PictureViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate>

@property BOOL newMedia;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PictureViewController
//added Mobile Core services framework

- (void)viewDidLoad {
    [super viewDidLoad];

}




-(void)viewWillAppear:(BOOL)animated
{
    [self showAlert];
    
}

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
        self.imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
//TY
        //use PFUser currentuser
        TUPFUser *user = [TUPFUser currentUser];
        NSLog(@"current user %@", user.username);
        TUPhoto *photo = [TUPhoto object];
        photo.pid = photo.objectId;
        photo.uploadedBy = user.username;

        //image size limit 10M for PFFIle

        UIImage *image = [TYUtility imageWithImage:self.imageView.image scaledToSize:CGSizeMake(200.0, 200.0)];
        NSData *imageData = UIImagePNGRepresentation(image);
        //photo.imageThumbnailNSData = imageData; <=128kb

        PFFile *imagePFFile = [PFFile fileWithName:photo.objectId data:imageData];
      //  [imagePFFile saveInBackground];

        photo.imagePFFile = imagePFFile;
        [photo saveInBackground];

//TY


        
        // go back to first view
        self.tabBarController.selectedIndex = 0;
        [self dismissViewControllerAnimated:YES completion:nil];

    }



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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
