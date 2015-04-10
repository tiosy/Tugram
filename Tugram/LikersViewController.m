//
//  LikersViewController.m
//  Tugram
//
//  Created by Justin Haar on 4/9/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "LikersViewController.h"

@interface LikersViewController () <UITableViewDataSource, UITabBarDelegate>

@end

@implementation LikersViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (IBAction)dismissButtonTapped:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
