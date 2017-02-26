//
//  GbDate.h
//  GeniePlanner
//
//  Created by Michal Olszewski on 27.11.2013.
//  Copyright (c) 2013 GenieBelt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GbBaseDate.h"

@interface GbDate : GbBaseDate

- (instancetype)initWithNumber:(NSNumber *)seconds timeZoneForSecondsFromGMT:(NSNumber *)offset;
@end
