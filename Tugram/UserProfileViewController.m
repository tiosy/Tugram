//
//  UserProfileViewController.m
//  Tugram
//
//  Created by Justin Haar on 4/9/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "UserProfileViewController.h"

@interface UserProfileViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation UserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:87/255.0 green:215/255.0 blue:255/255.0 alpha:2];
    self.tabBarController.tabBar.barTintColor = [UIColor colorWithRed:87/255.0 green:215/255.0 blue:255/255.0 alpha:2];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.tabBarController.tabBar.tintColor = [UIColor whiteColor];

    self.imageView.layer.borderColor = [UIColor colorWithRed:87/255.0 green:215/255.0 blue:255/255.0 alpha:1].CGColor;
    self.imageView.layer.borderWidth = 2.0;
    self.imageView.backgroundColor = [UIColor whiteColor];

    self.collectionView.layer.borderColor = [UIColor colorWithRed:87/255.0 green:215/255.0 blue:255/255.0 alpha:2].CGColor;
    self.collectionView.layer.borderWidth = 2;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    return cell;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (IBAction)followersOnTapped:(UIButton *)sender {
}
- (IBAction)followingOnTapped:(UIButton *)sender {
}
- (IBAction)followOnTapped:(UIButton *)sender
{
    sender.titleLabel.textColor = [UIColor greenColor];
}

@end
