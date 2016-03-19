//
//  Feed.m
//  Feeds4Free
//
//  Created by jsd on 17.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import "Feed.h"
#import "FeedItem.h"

@implementation Feed

- (NSArray*) sortedItems
{
    NSArray* feedItems = [self.feedItems allObjects];
    return [feedItems sortedArrayUsingComparator:^NSComparisonResult(FeedItem*  _Nonnull obj1, FeedItem*  _Nonnull obj2)
    {
        return obj1.date.timeIntervalSince1970 < obj2.date.timeIntervalSince1970;
    }];
}

@end
