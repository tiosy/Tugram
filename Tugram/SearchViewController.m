//
//  SearchViewController.m
//  Tugram
//
//  Created by Justin Haar on 4/7/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "SearchViewController.h"
#import "TUUser.h"

@interface SearchViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic)  NSMutableArray *filteredUsers;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    TUUser *user = [TUUser object];
    user = self.filteredUsers[indexPath.row];
    cell.textLabel.text = user.username;
    return cell;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.filteredUsers.count;
}


-(void)setFilteredUsers:(NSMutableArray *)filteredUsers
{
    _filteredUsers = filteredUsers;
    [self.tableView reloadData];
}


//-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
//{
//    if (searchText.length == 0)
//    {
//        self.filteredUsers = nil;
//    } else
//    {
//        [self.filteredUsers removeAllObjects];
//
//        //What array of users are we referencing
//        for (TUUser *user in )
//        {
//            NSRange nameRange = [user.username rangeOfString:self.searchBar.text options:NSCaseInsensitiveSearch];
//            if (nameRange.location != NSNotFound)
//            {
//                [self.filteredUsers addObject:user];
//            }
//        }
//    }
//    [self.tableView reloadData];
//}

//WE'RE GOING TO REFERENCE BOOKCLUB FRIENDSVIEWCONTROLLER

@end
