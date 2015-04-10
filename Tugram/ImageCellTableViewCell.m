//
//  ImageCellTableViewCell.m
//  Tugram
//
//  Created by Justin Haar on 4/7/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "ImageCellTableViewCell.h"
#import "LoginViewController.h"
#import "CommentsViewController.h"
#import "TUPFUser.h"


@implementation ImageCellTableViewCell

- (void)awakeFromNib {

    int x = 0;

    self.likeCountLabel.userInteractionEnabled = YES;
    self.userNameLabel.userInteractionEnabled = YES;
    self.likeCountLabel.text = [NSString stringWithFormat:@"%d", x];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


    // Configure the view for the selected state
}
- (IBAction)likeButtonTapped:(UIButton *)sender
{
    if (self.likeButton.backgroundColor != [UIColor redColor])
    {
        int x = 1;
        self.likeButton.backgroundColor = [UIColor redColor];
        self.likeButton.titleLabel.text = [NSString stringWithFormat:@"Liked"];
        self.likeCountLabel.text = [NSString stringWithFormat:@"%d", x++];
    } else
    {
        int x = 1;
        self.likeButton.backgroundColor = [UIColor whiteColor];
        self.likeButton.titleLabel.text = [NSString stringWithFormat:@"Like"];
        self.likeCountLabel.text = [NSString stringWithFormat:@"%d", --x];
    }

}


@end
