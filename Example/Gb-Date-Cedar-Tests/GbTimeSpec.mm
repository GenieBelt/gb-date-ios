#import <Cedar/Cedar.h>
#import "GbTime.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(GbTimeSpec)

describe(@"GbTime ", ^{
    
    beforeEach(^{
        
    });
    
    it(@"Should init with current date", ^{
        [[[GbTime  alloc] init] timeIntervalSinceNow] should be_less_than(2.0);
    });
    
    it(@"Should init with string", ^{
        id date = [[GbTime  alloc] initWithString:@"1970-01-01T00:00:00.000GMT"];
        [date class] should equal([GbTime  class]);
        [date timeIntervalSince1970] should equal(0);
    });
    
    it(@"Should init with number", ^{
        id date = [[GbTime  alloc] initWithNumber:@0];
        [date class] should equal([GbTime  class]);
        [date timeIntervalSince1970] should equal(0);
    });
    
    it(@"should return proper hash string", ^{
        [GbTime  apiStringFromDate:[GbTime  dateWithTimeIntervalSince1970:0]] should equal(@"0.000000");
    });
});

SPEC_END
