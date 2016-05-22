//
//  JDFeedItemCell.m
//  Feeds4Free
//
//  Created by jsd on 17.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import "JDFeedItemCell.h"
#import "FeedItem.h"
#import "NSString+DateFormats.h"

@implementation JDFeedItemCell

- (void)awakeFromNib
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupCellWithFeedItem:(FeedItem*)item {
    if (item) {
        self.title.text = item.title;
        self.date.text = [NSString formattedStringForDate:item.date];
        self.isReadedLabel.hidden = [item.isReaded boolValue];
    }
}

@end
