//
//  JDFeedCell.h
//  Feeds4Free
//
//  Created by jsd on 17.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDBaseCell.h"

@class Feed;
@interface JDFeedCell : JDBaseCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *summary;
@property (weak, nonatomic) IBOutlet UILabel *unreadedCountLabel;

- (void)setupCellWithFeed:(Feed*)feed;

@end
