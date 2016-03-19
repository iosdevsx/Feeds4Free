//
//  JDPreviewViewController.m
//  Feeds4Free
//
//  Created by jsd on 16.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import "JDPreviewViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "JDWebViewController.h"
#import "NSString+DateFormats.h"

@interface JDPreviewViewController ()

@property (weak, nonatomic) IBOutlet UILabel *feedTitle;
@property (weak, nonatomic) IBOutlet UILabel *feedDate;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *feedImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;

@end

@implementation JDPreviewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.feedItem.title;
    
    //Fill view from data
    self.feedDate.text = [NSString formattedStringForDate:self.feedItem.date];
    self.feedTitle.attributedText = [self addUnderlineToText:self.feedItem.title];
    [self addTapGestureToView:self.feedTitle];
    [self configureTextView:self.textView forData:self.feedItem.summary];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //change constraints for FeedItem Image
    if (self.feedItem.image)
    {
        self.imageHeight.constant = 180;
        
        [self.feedImage sd_setImageWithURL:[NSURL URLWithString:self.feedItem.image]
                          placeholderImage:nil];
    } else
    {
        self.imageHeight.constant = 0;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -Gestures

//Gesture to open web version by tapping on title
- (void) handleTapGesture: (UITapGestureRecognizer*) gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded)
    {
        JDWebViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([JDWebViewController class])];
        vc.feedItem = self.feedItem;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - Private Methods

//Generate normal text from HTML
- (void) configureTextView: (UITextView*) textView forData: (NSString*) data
{
    textView.text = data;
    UIFont* font = [UIFont systemFontOfSize:17.0];
    NSMutableAttributedString * attributeString = [[NSMutableAttributedString alloc]
                                                   initWithData:[data dataUsingEncoding:NSUnicodeStringEncoding]
                                                   options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType}
                                                   documentAttributes:nil error:nil];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attributeString.length)];
    textView.attributedText = attributeString;
    [textView scrollRangeToVisible:NSMakeRange(0, 0)];
}

- (NSAttributedString*) addUnderlineToText: (NSString*) text
{
    NSDictionary* underline = @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle), NSBaselineOffsetAttributeName: @(-1)};
    return [[NSAttributedString alloc] initWithString:text attributes:underline];
}

- (void) addTapGestureToView: (UIView*) view
{
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [view addGestureRecognizer:tapGesture];
    view.userInteractionEnabled = YES;
}

@end
