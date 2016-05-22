//
//  JDFeedItemTableProvider.m
//  Feeds4Free
//
//  Created by jsd on 17.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//
#import "NSString+DateFormats.h"

#import "JDFeedItemTableProvider.h"
#import "JDFeedItemCell.h"

#import "Feed.h"
#import "FeedItem.h"

static NSString* CellId = @"JDFeedItemCell";

@implementation JDFeedItemTableProvider

#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JDFeedItemCell* cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell) {
        cell = [[JDFeedItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    static Feed* currentFeed = nil;
    if (!currentFeed) {
        currentFeed = [[self.items firstObject] feed];
    }
    [cell setupCellWithFeedItem:[self.items objectAtIndex:indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [JDFeedItemCell heightForCell];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
