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


@interface PictureViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property BOOL newMedia;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property UIImagePickerController *imagePicker;

@end

@implementation PictureViewController
//added Mobile Core services framework

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imagePicker = [[UIImagePickerController alloc] init];

    self.imagePicker.delegate = self;

    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera && UIImagePickerControllerSourceTypePhotoLibrary;

    self.imagePicker.mediaTypes = @[(NSString *) kUTTypeImage, (NSString *) kUTTypeMovie];

    self.imagePicker.allowsEditing = YES;

    self.newMedia = YES;
}


-(void)viewDidAppear:(BOOL)animated
{
    if (self.imagePicker)
    {
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    }
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Code here to work with media

    NSString *mediaType = info[UIImagePickerControllerMediaType];

    ImageCellTableViewCell *imageCell = [ImageCellTableViewCell new];


    if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
    {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        imageCell.imageView.image = image;

        [self.imageView setAutoresizingMask:(UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth)];
        if (self.newMedia)
            UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:finishedSavingWithError:contextInfo:), nil);
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaType);
    }

    [self dismissViewControllerAnimated:YES completion:nil];

    MainViewController *mainVC = [MainViewController new];
    [self presentViewController:mainVC animated:YES completion:nil];


}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
    self.imagePicker = nil;
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
