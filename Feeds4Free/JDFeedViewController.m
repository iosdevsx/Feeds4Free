//
//  JDFeedTableViewController.m
//  Feeds4Free
//
//  Created by jsd on 16.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import "JDFeedViewController.h"
#import "JDFeedItemViewController.h"
#import "JDFeedTableProvider.h"
#import "JDCoreDataHelper.h"
#import "JDXMLParser.h"
#import "Feed.h"

@interface JDFeedViewController () <JDBaseTableDelegate, JDXMLParserDelegate>

@property (strong, nonatomic) JDFeedTableProvider* provider;
@property (strong, nonatomic) JDCoreDataHelper* dataHelper;
@property (strong, nonatomic) JDXMLParser* parser;

@end

@implementation JDFeedViewController

- (void)loadView
{
    [super loadView];
    self.provider = [[JDFeedTableProvider alloc] init];
    self.dataHelper = [JDCoreDataHelper sharedHelper];
    self.parser = [[JDXMLParser alloc] init];
    
    self.parser.delegate = self;
    self.provider.delegate = self;
    self.tableView.delegate = self.provider;
    self.tableView.dataSource = self.provider;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.provider.items = [self.dataHelper allFeeds];
    [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reloadSections];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Actions

- (IBAction)actionAddFeed:(UIBarButtonItem *)sender
{
    [self showCreateFeedAlert];
}

#pragma mark - Private Methods

- (void) addFeedPressed: (NSURL*) url
{
    [self.parser beginParseWithURL:url];
}

- (void) reloadSections
{
    [self.tableView reloadData];
}

- (void) reloadItems
{
    self.provider.items = [self.dataHelper allFeeds];
}

#pragma mark - JDBaseTableDelegate

- (void) cellSelectedAtIndexPath: (NSIndexPath*) indexPath
{
    JDFeedItemViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([JDFeedItemViewController class])];
    vc.feed = [self feedForIndexPath:indexPath];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) cellDeleteAtIndexPath: (NSIndexPath*) indexPath
{
    Feed* feedToDelete = [self feedForIndexPath:indexPath];
    [self.dataHelper deleteEntity:feedToDelete];
    
    [self reloadItems];
    
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    [self.tableView endUpdates];
}

- (Feed*) feedForIndexPath: (NSIndexPath*) indexPath
{
    return [self.provider.items objectAtIndex:indexPath.row];
}

#pragma mark - JDXMLParser

- (void) parseDidFinihWithFeed: (Feed*) feed
{
    [self reloadItems];
    [self reloadSections];
    
    [self.dataHelper save];
}


@end
