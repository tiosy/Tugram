//
//  ViewController.m
//  Tugram
//
//  Created by tim on 4/6/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "MainViewController.h"
#import <Parse/Parse.h>
#import "ImageCellTableViewCell.h"
#import "CommentsViewController.h"
#import "LoginViewController.h"
#import "TUPFUser.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>

@property NSMutableArray *pictures;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *likersTapGesture;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:87/255.0 green:215/255.0 blue:255/255.0 alpha:2];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Arial" size:20]}];
    self.tabBarController.tabBar.tintColor = [UIColor blackColor];
    self.tabBarController.tabBar.barTintColor = [UIColor colorWithRed:87/255.0 green:215/255.0 blue:255/255.0 alpha:2];


    self.tapGesture = [UITapGestureRecognizer new];
    self.tapGesture.delegate = self;
    self.tapGesture.enabled = YES;

    self.likersTapGesture = [UITapGestureRecognizer new];
    self.likersTapGesture.delegate = self;
    self.likersTapGesture.enabled = YES;


    LoginViewController *loginVC = [LoginViewController new];
    TUPFUser *currentUser = [TUPFUser currentUser];
    if (!currentUser) {
        [self presentViewController:loginVC animated:YES completion:nil];
    }
    NSLog(@"%@", currentUser);

    //THIS IS WHERE WE NEED OUR PICTURES
    self.pictures = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"Audis4"], [UIImage imageNamed:@"Beach"], [UIImage imageNamed:@"Sand"], [UIImage imageNamed:@"TennisBall"], nil];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell"];
    cell.pictureImageView.image = self.pictures[indexPath.row];
    cell.thumbnailImage.image = self.pictures[indexPath.row];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell"];

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.pictures.count;
}
- (IBAction)commentButtonTapped:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"comment" sender:self];
}

- (IBAction)tapGestureOnTapped:(UITapGestureRecognizer *)sender
{
    [self performSegueWithIdentifier:@"likers" sender:self];
}
- (IBAction)likeCountTapGesture:(UITapGestureRecognizer *)sender
{
    [self performSegueWithIdentifier:@"profile" sender:self];
}

@end
