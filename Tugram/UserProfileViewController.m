//
//  UserProfileViewController.m
//  Tugram
//
//  Created by Justin Haar on 4/9/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "UserProfileViewController.h"

@interface UserProfileViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation UserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)followersOnTapped:(UIButton *)sender {
}
- (IBAction)followingOnTapped:(UIButton *)sender {
}
- (IBAction)followOnTapped:(UIButton *)sender
{
    sender.titleLabel.textColor = [UIColor greenColor];
}

@end
