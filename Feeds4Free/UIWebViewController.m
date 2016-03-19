//
//  UIWebViewController.m
//  Feeds4Free
//
//  Created by jsd on 16.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import "UIWebViewController.h"

@interface UIWebViewController ()

@end

@implementation UIWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL* url = [NSURL URLWithString:self.feedItem.link];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.navigationItem.title = self.feedItem.title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) enableButtons
{
    self.goBackItem.enabled = self.webView.canGoBack;
    self.goForwardItem.enabled = self.webView.canGoForward;
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self enableButtons];
}

#pragma mark - Actions

- (IBAction)actionRefresh:(UIBarButtonItem *)sender
{
    [self.webView stopLoading];
    [self.webView reload];
}

- (IBAction)actionGoBack:(UIBarButtonItem*)sender
{
    if ([self.webView canGoBack])
    {
        [self.webView stopLoading];
        [self.webView goBack];
    }
}
- (IBAction)actionGoForward:(UIBarButtonItem*)sender
{
    if ([self.webView canGoForward])
    {
        [self.webView stopLoading];
        [self.webView goForward];
    }
}

@end
