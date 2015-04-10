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

    self.thumbnailImage.layer.borderColor = [UIColor colorWithRed:87/255.0 green:215/255.0 blue:255/255.0 alpha:1].CGColor;
    self.thumbnailImage.layer.borderWidth = 2.0;
    self.likeButton.layer.borderColor = [UIColor colorWithRed:87/255.0 green:215/255.0 blue:255/255.0 alpha:1].CGColor;
    self.likeButton.layer.borderWidth = 2.0;
    self.likeCountLabel.layer.borderColor = [UIColor colorWithRed:87/255.0 green:215/255.0 blue:255/255.0 alpha:1].CGColor;
    self.likeCountLabel.layer.borderWidth = 2.0;
    self.likeCountLabel.hidden = YES;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


    // Configure the view for the selected state
}
- (IBAction)likeButtonTapped:(UIButton *)sender
{
    if (![self.likeButton.backgroundColor isEqual:[UIColor colorWithRed:87/255.0 green:215/255.0 blue:255/255.0 alpha:1]])
    {
        int x = 1;
        self.likeButton.backgroundColor = [UIColor colorWithRed:87/255.0 green:215/255.0 blue:255/255.0 alpha:1];
        [self.likeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.likeButton setTitle:@"Liked" forState:UIControlStateNormal];
        self.likeCountLabel.text = [NSString stringWithFormat:@"%d", x++];
        self.likeCountLabel.hidden = NO;
    } else
    {
        int x = 1;
        [self.likeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.likeButton setTitle:@"Like" forState:UIControlStateNormal];
        self.likeButton.backgroundColor = [UIColor whiteColor];
        self.likeCountLabel.text = [NSString stringWithFormat:@"%d", --x];
    }

}


@end
