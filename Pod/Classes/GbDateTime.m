//
//  GbDateTime.m
//  GeniePlanner
//
//  Created by Michal Olszewski on 27.11.2013.
//  Copyright (c) 2013 GenieBelt. All rights reserved.
//

#import "GbDateTime.h"
#import "GbDateConstants.h"

@implementation GbDateTime

+ (NSString *)apiStringFromDate:(NSDate *)date {
    return [NSString stringWithFormat:@"%.0f", [date timeIntervalSince1970]];
}

- (id)initWithString:(NSString *)dateString {
    if ([dateString isEqual:[NSNull null]]) {
        return nil;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:GB_API_DATE_TIME_FORMAT];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSDate *date = [dateFormatter dateFromString:dateString];
    return [self initWithTimeIntervalSince1970:[date timeIntervalSince1970]];
}


@end
