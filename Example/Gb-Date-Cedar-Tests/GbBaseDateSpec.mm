#import <Cedar/Cedar.h>
#import "GbBaseDate.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(GbBaseDateSpec)

describe(@"GbBaseDate", ^{

    beforeEach(^{

    });
    
    it(@"should return string from date", ^{
        [GbBaseDate stringFromDate:[NSDate dateWithTimeIntervalSince1970:0]] should equal(@"1970-01-01T00:00:00.000GMT");
    });
    
    it(@"should return gbDate from date", ^{
        id gbDate = [GbBaseDate gbDateFromDate: [NSDate dateWithTimeIntervalSince1970:0]];
        [gbDate class] should equal(GbBaseDate.class);
        [gbDate timeIntervalSince1970] should equal(0);
    });
    
    it(@"should alloc from string", ^{
        id gbDate = [[GbBaseDate alloc] initWithString:@"1970-01-01T00:00:00.000GMT"];
        [gbDate class] should equal(GbBaseDate.class);
        [gbDate timeIntervalSince1970] should equal(0);
    });
    
    it(@"should init with cuurent date", ^{
        [[[GbBaseDate alloc] init] timeIntervalSinceNow] should be_less_than(2.0);
    });
    
    it(@"should return string with only date", ^{
        [[[[GbBaseDate alloc] init] stringWithDateOnly] length] should equal(11);
    });
    
    
});

SPEC_END
