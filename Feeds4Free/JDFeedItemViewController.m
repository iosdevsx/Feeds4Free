//
//  JDFeedItemViewController.m
//  Feeds4Free
//
//  Created by jsd on 16.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import "JDFeedItemViewController.h"
#import "JDFeedItemTableProvider.h"
#import "JDPreviewViewController.h"
#import "JDFeedItemCell.h"
#import "JDCoreDataHelper.h"
#import "JDXMLParser.h"

@interface JDFeedItemViewController () <JDBaseTableDelegate, JDXMLParserDelegate>

@property (strong, nonatomic) JDFeedItemTableProvider* provider;
@property (strong, nonatomic) UIRefreshControl* refreshControl;
@property (strong, nonatomic) JDCoreDataHelper* dataHelper;
@property (strong, nonatomic) JDXMLParser* parser;

@end

@implementation JDFeedItemViewController
@synthesize refreshControl = _refreshControl;

-(void)loadView
{
    [super loadView];
    self.provider = [[JDFeedItemTableProvider alloc] init];
    self.dataHelper = [JDCoreDataHelper sharedHelper];
    
    self.tableView.delegate = self.provider;
    self.tableView.dataSource = self.provider;
    self.tableView.editing = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.parser = [[JDXMLParser alloc] init];
    self.parser.delegate = self;
    self.provider.delegate = self;
    
    //insert "pull-to-refresh" mechanism
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshItems) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
    
    self.provider.items = [self.feed sortedItems];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Actions

//Get new items from server, when user pull table
- (void) refreshItems
{
    NSURL* url = [NSURL URLWithString:self.feed.url];
    [self.parser beginParseWithURL:url];
}


#pragma mark - JDXMLParserDelegate

- (void) parseDidFinishWithFeed: (Feed*) feed
{
    NSArray* allItems = [self.feed.feedItems allObjects];
    
    //get dates and titles from all item, for exclude duplicates
    NSArray* allDates = [allItems valueForKey:@"date"];
    NSArray* allTitles = [allItems valueForKey:@"title"];
    
    Feed* updatedFeed = feed;
    NSArray* updatedFeedItems = [updatedFeed.feedItems allObjects];
    
    [self.dataHelper deleteEntity:feed];
    for (FeedItem* item in updatedFeedItems)
    {
        //if item already in database, then delete it, otherwise add to database
        if (![allDates containsObject:item.date] && ![allTitles containsObject:item.title])
        {
            item.feed = self.feed;
        } else
        {
            [self.dataHelper deleteEntity:item];
        }
    }
    
    //save and reload
    [self.dataHelper save];
    
    [self reloadItems];
    [self reloadSections];
    [self.refreshControl endRefreshing];
}

#pragma mark - JDBaseTableDelegate

- (void) cellSelectedAtIndexPath: (nullable NSIndexPath*) indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    FeedItem* item = [self.provider.items objectAtIndex:indexPath.row];
    JDFeedItemCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (![item.isReaded boolValue])
    {
        item.isReaded = [NSNumber numberWithBool:YES];
        cell.isReadedLabel.hidden = YES;
        [self.dataHelper save];
    }
    
    JDPreviewViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([JDPreviewViewController class])];
    vc.feedItem = item;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) reloadSections
{
    [self.tableView reloadData];
}

- (void) reloadItems
{
    self.provider.items = [self.feed sortedItems];
}

@end
