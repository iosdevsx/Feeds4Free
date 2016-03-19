//
//  JDPreviewViewController.h
//  Feeds4Free
//
//  Created by jsd on 16.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedItem.h"

@interface JDPreviewViewController : UIViewController

#warning set private
@property (weak, nonatomic) IBOutlet UILabel *feedTitle;
@property (weak, nonatomic) IBOutlet UILabel *feedDate;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *feedImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;


@property (strong, nonatomic) FeedItem* feedItem;

@end
