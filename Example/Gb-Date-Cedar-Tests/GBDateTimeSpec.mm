#import <Cedar/Cedar.h>
#import "GBDateTime.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(GBDateTimeSpec)

describe(@"GbDateTime", ^{
    
    beforeEach(^{
        
    });
    
    it(@"Should init with current date", ^{
        [[[GbDateTime alloc] init] timeIntervalSinceNow] should be_less_than(2.0);
    });
    
    it(@"Should init with string", ^{
        id date = [[GbDateTime alloc] initWithString:@"1970-01-01T00:00:00.000GMT"];
        [date class] should equal([GbDateTime class]);
        [date timeIntervalSince1970] should equal(0);
    });
    
    it(@"Should init with number", ^{
        id date = [[GbDateTime alloc] initWithNumber:@0];
        [date class] should equal([GbDateTime class]);
        [date timeIntervalSince1970] should equal(0);
    });
    
    it(@"should return proper hash string", ^{
        [GbDateTime apiStringFromDate:[GbDateTime dateWithTimeIntervalSince1970:0]] should equal(@"0");
    });
});

SPEC_END
