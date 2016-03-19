//
//  JDPreviewViewController.m
//  Feeds4Free
//
//  Created by jsd on 16.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import "JDPreviewViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIWebViewController.h"
#import "NSString+DateFormats.h"

@interface JDPreviewViewController ()

@end

@implementation JDPreviewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDictionary* underline = @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle), NSBaselineOffsetAttributeName: @(-1)};
    self.feedTitle.attributedText = [[NSAttributedString alloc] initWithString:self.feedItem.title
                                                                    attributes:underline];
    [self.feedTitle setNeedsLayout];
    self.navigationItem.title = self.feedItem.title;
    self.feedText.text = self.feedItem.summary;
    self.feedDate.text = [NSString formattedStringForDate:self.feedItem.date];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.feedTitle addGestureRecognizer:tapGesture];
    self.feedTitle.userInteractionEnabled = YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.feedItem.image)
    {
        self.imageHeight.constant = 180;
        self.textHeight.constant = 200;
        [self.feedImage sd_setImageWithURL:[NSURL URLWithString:self.feedItem.image]
                          placeholderImage:nil];
    } else
    {
        self.imageHeight.constant = 0;
        self.textHeight.constant = 400;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) handleTapGesture: (UITapGestureRecognizer*) gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded)
    {
        UIWebViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([UIWebViewController class])];
        vc.feedItem = self.feedItem;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
