//
//  LoginViewController.m
//  Tugram
//
//  Created by Justin Haar on 4/7/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "LoginViewController.h"
#import "ImageCellTableViewCell.h"
#import "MainViewController.h"
#import "TUPFUser.h"

@interface LoginViewController () <UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    TUPFUser *user = [TUPFUser currentUser];


//    TUPFUser *currentUser = [TUPFUser currentUser];

//    
//    if (TUPFUser.currentUser) {
//        [self performSegueWithIdentifier:@"mainfeed" sender:self];
//    }
//    else {
//        [self presentViewController:self animated:YES completion:nil];
//    }
}

- (IBAction)onSignUp:(UIButton *)sender
{
    TUPFUser *user = [TUPFUser new];
    user.fullName = self.nameTextField.text;
    user.username = self.usernameTextField.text;
    user.password = self.passwordTextField.text;
    user.email = self.emailTextField.text;

    // other fields can be set just like with PFObject
//    user[@"phone"] = @"415-392-0202";

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
    {
        if (!error)
        {
            [user signUp];
            [self performSegueWithIdentifier:@"mainfeed" sender:self];


        } else
        {
            NSString *errorString = [error userInfo][@"error"];

            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Username or Email is incorrect" message:nil preferredStyle:UIAlertControllerStyleAlert];

            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {

            }];

            alertController.message = errorString;
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:^{
                nil;
            }];
        }
    }];
}


- (IBAction)onLogIn:(UIButton *)sender
{

    [TUPFUser logInWithUsernameInBackground:self.usernameTextField.text password:self.passwordTextField.text block:^(PFUser *user, NSError *error) {

        if (error) {
            NSLog(@"%@, %@", self.usernameTextField.text, self.passwordTextField.text);
            NSLog(@"%@", error);
        }

        if (user)
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Login Failed" message:nil preferredStyle:UIAlertControllerStyleAlert];

            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {

            }];

            alertController.message = @"Username or Email is incorrect";
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:^{
                nil;
            }];

        }
    }];

}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
