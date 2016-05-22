//
//  JDFeedItemCell.h
//  Feeds4Free
//
//  Created by jsd on 17.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDBaseCell.h"

@class FeedItem;
@interface JDFeedItemCell : JDBaseCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIView *isReadedLabel;

- (void)setupCellWithFeedItem:(FeedItem*)item;

@end
