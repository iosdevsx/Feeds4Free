//
//  NSString+DateFormats.m
//  Feeds4Free
//
//  Created by jsd on 18.03.16.
//  Copyright © 2016 jsd. All rights reserved.
//

#import "NSString+DateFormats.h"

@implementation NSString (DateFormats)

//return formatted string from date
+ (NSString*) formattedStringForDate: (NSDate*) date
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.MM.yyyy"];
    return [NSString stringWithFormat:@"%@", [formatter stringFromDate:date]];
}

@end
