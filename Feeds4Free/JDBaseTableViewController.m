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

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void) showCreateFeedAlert
{
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"add_feed_title", nil)
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = NSLocalizedString(@"add_feed_placeholder", nil);
    }];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"cancel_button", nil)
                                                           style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction* addAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"add_button", nil)
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

- (void) showErrorAlertWithTitle: (NSString*) title andMessage: (NSString*) message
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) addFeedPressed: (NSURL*) url
{
    //override in subclass
}

@end
