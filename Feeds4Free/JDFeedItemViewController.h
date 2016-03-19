//
//  JDFeedItemViewController.h
//  Feeds4Free
//
//  Created by jsd on 16.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Feed.h"
#import "JDBaseTableViewController.h"

@interface JDFeedItemViewController : JDBaseTableViewController

@property (strong, nonatomic) Feed* feed;

@end
