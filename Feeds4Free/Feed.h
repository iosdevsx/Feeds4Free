//
//  Feed.h
//  Feeds4Free
//
//  Created by jsd on 17.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <MagicalRecord/MagicalRecord.h>

@class FeedItem;

NS_ASSUME_NONNULL_BEGIN

@interface Feed : NSManagedObject

- (NSArray*) sortedItems;

@end

NS_ASSUME_NONNULL_END

#import "Feed+CoreDataProperties.h"
