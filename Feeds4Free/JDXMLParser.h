//
//  JDXMLParser.h
//  Feeds4Free
//
//  Created by jsd on 17.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MWFeedParser/MWFeedParser.h>
#import <MagicalRecord/MagicalRecord.h>
#import "Feed.h"
#import "FeedItem.h"

@protocol JDXMLParserDelegate;

@interface JDXMLParser : NSObject <MWFeedParserDelegate>

@property (weak, nonatomic) id <JDXMLParserDelegate> delegate;

- (void) beginParseWithURL: (NSURL*) feedUrl;

@end

@protocol JDXMLParserDelegate <NSObject>

- (void) parseDidFinihWithFeed: (Feed*) feed;

@end
