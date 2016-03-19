//
//  JDXMLParser.m
//  Feeds4Free
//
//  Created by jsd on 17.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import "JDXMLParser.h"

@interface JDXMLParser()

@property (strong, nonatomic) Feed* feed;

@end

@implementation JDXMLParser

- (void) beginParseWithURL: (NSURL*) feedUrl
{
    MWFeedParser* parser = [[MWFeedParser alloc] initWithFeedURL:feedUrl];
    parser.delegate = self;
    [parser parse];
}

#pragma mark - MWFeedParserDelegate

- (void)feedParserDidStart:(MWFeedParser *)parser
{
    self.feed = [Feed MR_createEntity];
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedInfo:(MWFeedInfo *)info
{
    self.feed.title = info.title;
    self.feed.summary = info.summary;
    self.feed.url = info.url.absoluteString;
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item
{
    FeedItem* feedItem = [FeedItem MR_createEntity];
    
    feedItem.title = item.title;
    feedItem.link = item.link;
    feedItem.date = item.date;
    feedItem.identifier = item.identifier;
    feedItem.summary = item.summary;
    feedItem.isReaded = [NSNumber numberWithBool:NO];
    feedItem.author = item.author;
    if (item.enclosures)
    {
        NSDictionary* enclosure = [item.enclosures firstObject];
        NSString* type = [enclosure valueForKey:@"type"];
        if ([type containsString:@"image"])
        {
            feedItem.image = [enclosure valueForKey:@"url"];
        }
    }
    
    [self.feed addFeedItemsObject:feedItem];
}

- (void)feedParserDidFinish:(MWFeedParser *)parser
{
    [self.delegate parseDidFinihWithFeed:self.feed];
}

- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error
{
    NSLog(@"%@", [error localizedDescription]);
}

@end
