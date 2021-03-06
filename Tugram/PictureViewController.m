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


@interface PictureViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate>

@property BOOL newMedia;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PictureViewController
//added Mobile Core services framework

- (void)viewDidLoad {
    [super viewDidLoad];

}


-(void)viewDidAppear:(BOOL)animated
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
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];

        ImageCellTableViewCell *cell = [ImageCellTableViewCell new];
        cell.imageView.image = image;

        [cell.imageView setAutoresizingMask:(UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth)];
        if (self.newMedia)
            UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:finishedSavingWithError:contextInfo:), nil);
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaType);
    }

    [self dismissViewControllerAnimated:YES completion:nil];

//    MainViewController *mainVC = [MainViewController new];

    [self performSegueWithIdentifier:@"home" sender:self];

//    [self presentViewController:mainVC animated:YES completion:nil];

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
