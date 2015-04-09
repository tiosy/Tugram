//
//  CommentsViewController.m
//  Tugram
//
//  Created by Justin Haar on 4/8/15.
//  Copyright (c) 2015 Timothy Yeh. All rights reserved.
//

#import "CommentsViewController.h"

@interface CommentsViewController ()

@end

@implementation CommentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
    return YES;
}

@end
