//
//  JDBaseCell.m
//  Feeds4Free
//
//  Created by jsd on 18.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import "JDBaseCell.h"

@implementation JDBaseCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat) heightForCell
{
    return 60.f;
}

@end
