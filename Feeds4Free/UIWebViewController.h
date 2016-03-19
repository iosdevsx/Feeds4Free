//
//  UIWebViewController.h
//  Feeds4Free
//
//  Created by jsd on 16.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedItem.h"

#warning refactor name
@interface UIWebViewController : UIViewController

@property (strong, nonatomic) FeedItem* feedItem;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goBackItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goForwardItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshItem;

@end
