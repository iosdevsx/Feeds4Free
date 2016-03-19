//
//  JDCoreDataHelper.m
//  Feeds4Free
//
//  Created by jsd on 17.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import "JDCoreDataHelper.h"

@implementation JDCoreDataHelper

+ (instancetype) sharedHelper
{
    static JDCoreDataHelper* helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[JDCoreDataHelper alloc] init];
    });
    return helper;
}

- (NSArray*) allFeeds
{
    NSArray* allFeeds = [Feed MR_findAllSortedBy:@"title" ascending:YES];
    return allFeeds;
}

- (void) deleteEntity: (NSManagedObject*) entity
{
    [entity MR_deleteEntity];
    [self save];
}

- (void) save
{
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:nil];
}

@end
