//
//  JDFeedTableProviderViewController.m
//  Feeds4Free
//
//  Created by jsd on 16.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import "JDFeedTableProvider.h"
#import "JDFeedCell.h"
#import "Feed.h"

static NSString* CellId = @"JDFeedCell";

@interface JDFeedTableProvider ()

@end

@implementation JDFeedTableProvider

#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JDFeedCell* cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    Feed* feed = [self.items objectAtIndex:indexPath.row];
    if (!cell) {
        cell = [[JDFeedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    [cell setupCellWithFeed:feed];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [JDFeedCell heightForCell];
}

@end
