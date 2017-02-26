//
//  GbDate.m
//  GeniePlanner
//
//  Created by Michal Olszewski on 27.11.2013.
//  Copyright (c) 2013 GenieBelt. All rights reserved.
//

#import "GbDate.h"
#import "GbDateConstants.h"

@implementation GbDate

+ (NSString *)apiStringFromDate:(NSDate *)date {
    NSTimeZone *destinationTimeZone = [NSTimeZone systemTimeZone];
    NSInteger timeZoneOffset = [destinationTimeZone secondsFromGMTForDate:date];
    return [NSString stringWithFormat:@"%.0f", [date timeIntervalSince1970] - timeZoneOffset];
}

- (id)initWithString:(NSString *)dateString {
    if ([dateString isEqual:[NSNull null]]) {
        return nil;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:GB_API_DATE_FORMAT];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSDate *date = [dateFormatter dateFromString:dateString];
    return [self initWithTimeIntervalSince1970:[date timeIntervalSince1970]];
}

- (instancetype)initWithNumber:(NSNumber *)seconds {
    if (!seconds || [seconds isEqual:[NSNull null]]) {
        return nil;
    }
    NSTimeZone *destinationTimeZone = [NSTimeZone systemTimeZone];
    NSInteger timeZoneOffset = [destinationTimeZone secondsFromGMTForDate:[NSDate date]];
    seconds = @([seconds doubleValue] + timeZoneOffset);
    self = [super initWithNumber:seconds];
    return self;
}

- (instancetype)initWithNumber:(NSNumber *)seconds timeZoneForSecondsFromGMT:(NSNumber *)offset {
    if (!seconds || [seconds isEqual:[NSNull null]]) {
        return nil;
    }
    seconds = @([seconds doubleValue] + offset.integerValue);
    self = [super initWithNumber:seconds];
    return self;
}

- (NSString *)apiString {
    return [self.class apiStringFromDate:self];
}

@end
