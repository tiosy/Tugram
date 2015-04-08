//
//  ImageCellTableViewCell.h
//  Tugram
//
//  Created by Justin Haar on 4/7/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImage;
@property (weak, nonatomic) IBOutlet UIButton *usernameButton;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeCountButton;
@property (weak, nonatomic) IBOutlet UITextView *commentsTextField;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
