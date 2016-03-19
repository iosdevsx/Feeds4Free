//
//  FeedItem+CoreDataProperties.h
//  Feeds4Free
//
//  Created by jsd on 18.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FeedItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedItem (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *author;
@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *identifier;
@property (nullable, nonatomic, retain) NSNumber *isReaded;
@property (nullable, nonatomic, retain) NSString *link;
@property (nullable, nonatomic, retain) NSString *summary;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *image;
@property (nullable, nonatomic, retain) Feed *feed;

@end

NS_ASSUME_NONNULL_END
