//
//  ViewController.m
//  Tugram
//
//  Created by tim on 4/6/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "MainViewController.h"
#import <Parse/Parse.h>

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>
//@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImage;
//@property (weak, nonatomic) IBOutlet UIButton *usernameButton;
//@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//@property (weak, nonatomic) IBOutlet UIButton *likeCountButton;
//@property (weak, nonatomic) IBOutlet UITextView *commentsTextField;
//@property (weak, nonatomic) IBOutlet UIButton *likeButton;
//@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell"];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

@end
