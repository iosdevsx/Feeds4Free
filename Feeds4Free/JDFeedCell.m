//
//  JDFeedCell.m
//  Feeds4Free
//
//  Created by jsd on 17.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import "JDFeedCell.h"
#import "Feed.h"

@implementation JDFeedCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupCellWithFeed:(Feed*)feed {
    if (feed) {
        self.title.text = feed.title;
        self.summary.text = feed.summary;
        NSArray* unreaded = [[feed.feedItems allObjects] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"isReaded = NO"]];
        self.unreadedCountLabel.text = [NSString stringWithFormat:@"%ld", (unsigned long)[unreaded count]];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
}

@end
