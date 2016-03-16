//
//  GbBaseDate.h
//  GeniePlanner
//
//  Created by Michal Olszewski on 27.11.2013.
//  Copyright (c) 2013 GenieBelt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GbBaseDate : NSDate <NSCoding, NSCopying>

+ (NSString *)stringFromDate:(NSDate *)date;

+ (NSString *)apiStringFromDate:(NSDate *)date;

+ (NSString *)stringWithDateOnlyFromDate:(NSDate *)date;

+ (instancetype)gbDateFromDate:(NSDate *)date;

- (instancetype)initWithString:(NSString *)dateString;

- (instancetype)initWithNumber:(NSNumber *)seconds;

- (NSString *)stringWithDateOnly;

- (NSString *)apiString;

@end
