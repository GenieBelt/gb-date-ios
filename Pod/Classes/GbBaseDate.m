//
//  GbBaseDate.m
//  GeniePlanner
//
//  Created by Michal Olszewski on 27.11.2013.
//  Copyright (c) 2013 GenieBelt. All rights reserved.
//

#import "GbBaseDate.h"
#import "GbDateConstants.h"

@implementation GbBaseDate {
    NSTimeInterval _timeInterval;
}

+ (NSString *)stringFromDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:GB_API_DATE_TIME_FORMAT];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)apiStringFromDate:(NSDate *)date {
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    return nil;
}

+ (instancetype)gbDateFromDate:(NSDate *)date {

    if (nil == date || [NSNull null] == (id) date) {
        return nil;
    }
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return [[GbBaseDate alloc] initWithNumber:@(timeInterval)];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _timeInterval = [[NSDate date] timeIntervalSince1970];
    }
    return self;
}

- (instancetype)initWithString:(NSString *)dateString {
    if ([dateString isEqual:[NSNull null]]) {
        return nil;
    }
    self = [super init];
    if (self) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:GB_API_DATE_TIME_FORMAT];
        [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        _timeInterval = [[formatter dateFromString:dateString] timeIntervalSince1970];
    }
    return self;
}

- (instancetype)initWithNumber:(NSNumber *)seconds {
    if (!seconds || [seconds isEqual:[NSNull null]]) {
        return nil;
    }
    self = [super init];
    if (self) {
        _timeInterval = [seconds doubleValue];
    }
    return self;
}

- (instancetype)initWithTimeIntervalSinceReferenceDate:(NSTimeInterval)ti {
    self = [super init];
    if (self) {
        NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:ti];
        _timeInterval = [date timeIntervalSince1970];
    }
    return self;
}

- (NSTimeInterval)timeIntervalSinceReferenceDate {
    return [[NSDate dateWithTimeIntervalSince1970:_timeInterval] timeIntervalSinceReferenceDate];
}

+ (NSString *)stringWithDateOnlyFromDate:(NSDate *)date {
    if (nil == date) {
        return nil;
    }

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:GB_DATE_ONLY_STRING_FORMAT];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];

    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;

}

- (NSString *)stringWithDateOnly {
    NSString *dateString = [[self class] stringWithDateOnlyFromDate:self];
    return dateString;
}

- (NSString *)apiString {
    return [NSString stringWithFormat:@"%.6f", _timeInterval];
}


@end
