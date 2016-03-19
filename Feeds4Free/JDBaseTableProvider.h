//
//  JDBaseTableViewController.h
//  Feeds4Free
//
//  Created by jsd on 16.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JDBaseTableDelegate;

@interface JDBaseTableProvider : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nullable, strong, nonatomic) NSArray* items;
@property (nullable, weak, nonatomic) id <JDBaseTableDelegate> delegate;

@end

@protocol JDBaseTableDelegate <NSObject>

@optional
- (void) cellSelectedAtIndexPath: (nullable NSIndexPath*) indexPath;
- (void) cellDeleteAtIndexPath: (nullable NSIndexPath*) indexPath;

@end