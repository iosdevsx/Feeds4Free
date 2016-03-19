//
//  JDBaseTableViewController.m
//  Feeds4Free
//
//  Created by jsd on 17.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import "JDBaseTableViewController.h"

@interface JDBaseTableViewController ()

@end

@implementation JDBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) showCreateFeedAlert
{
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"New Feed"
                                                                             message:@"Add new feed"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Type feed URL here...";
    }];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction* addAction = [UIAlertAction actionWithTitle:@"Add"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          UITextField* textField = [alertController.textFields firstObject];
                                                          if (textField.text.length > 0)
                                                          {
                                                              NSURL* feedUrl = [NSURL URLWithString:textField.text];
                                                              [self addFeedPressed:feedUrl];
                                                          }
                                                      }];
    
    
    
    [alertController addAction:cancelAction];
    [alertController addAction:addAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void) addFeedPressed: (NSURL*) url
{
    
}

@end
