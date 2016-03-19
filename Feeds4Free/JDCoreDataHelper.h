//
//  JDCoreDataHelper.h
//  Feeds4Free
//
//  Created by jsd on 17.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MagicalRecord/MagicalRecord.h>

#import "Feed.h"

@interface JDCoreDataHelper : NSObject

+ (instancetype) sharedHelper;

- (NSArray*) allFeeds;
- (void) deleteEntity: (NSManagedObject*) entity;
- (void) save;

@end
