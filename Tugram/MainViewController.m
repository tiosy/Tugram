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

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *pictures;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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

-(IBAction)unwindSegue:(UIStoryboardSegue *)segue
{
    CommentsViewController *commentsVC = segue.sourceViewController;
    ImageCellTableViewCell *cell = [ImageCellTableViewCell new];
    cell.commentsTextField.text = commentsVC.textView.text;
}

@end
