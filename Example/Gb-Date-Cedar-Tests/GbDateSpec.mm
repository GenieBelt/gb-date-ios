#import <Cedar/Cedar.h>
#import "GbDate.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(GbDateSpec)

describe(@"GbDate", ^{

    beforeEach(^{

    });
    
    it(@"Should init with current date", ^{
        [[[GbDate alloc] init] timeIntervalSinceNow] should be_less_than(2.0);
    });
    
    it(@"Should init with string", ^{
        id date = [[GbDate alloc] initWithString:@"1970-01-01"];
        [date class] should equal([GbDate class]);
        [date timeIntervalSince1970] should equal(0);
    });
    
    it(@"Should init with number", ^{
        id date = [[GbDate alloc] initWithNumber:@0];
        [date class] should equal([GbDate class]);
        NSTimeZone *destinationTimeZone = [NSTimeZone systemTimeZone];
        NSInteger timeZoneOffset = [destinationTimeZone secondsFromGMTForDate:[NSDate date]];
        [date timeIntervalSince1970] should equal(timeZoneOffset);
    });
    
    it(@"should return proper hash string", ^{
        NSTimeZone *destinationTimeZone = [NSTimeZone systemTimeZone];
        NSInteger timeZoneOffset = -1*[destinationTimeZone secondsFromGMTForDate:[NSDate date]];
        NSString *timeZoneOffsetString = [NSString stringWithFormat:@"%ld", (long)timeZoneOffset];
        [GbDate apiStringFromDate:[GbDate dateWithTimeIntervalSince1970:0]] should equal(timeZoneOffsetString);
    });
});

SPEC_END
