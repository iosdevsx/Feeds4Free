//
//  UIWebViewController.m
//  Feeds4Free
//
//  Created by jsd on 16.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import "JDWebViewController.h"

@interface JDWebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goBackItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goForwardItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshItem;

@end

@implementation JDWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.feedItem.title;
    
    NSURL* url = [NSURL URLWithString:self.feedItem.link];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

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
