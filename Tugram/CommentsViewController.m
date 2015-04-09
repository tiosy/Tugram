//
//  CommentsViewController.m
//  Tugram
//
//  Created by Justin Haar on 4/8/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "CommentsViewController.h"

@interface CommentsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *comments;
@end

@implementation CommentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.comments = [NSMutableArray new];
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell"];
    cell.textLabel.text = self.comments[indexPath.row];
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.comments.count;
}


- (IBAction)dismissButton:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)addButton:(UIButton *)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Add Comment" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Enter Comment Here";
    }];

    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

        UITextField *textField = alertController.textFields.firstObject;
        NSString *string = [NSString new];
        string = textField.text;
        [self.comments addObject:string];
        NSLog(@"%ld", (unsigned long)self.comments.count);
        [self.tableView reloadData];

    }];

    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:^{
        nil;
    }];
}
@end
