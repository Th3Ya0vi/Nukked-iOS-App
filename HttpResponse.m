
#import "HttpResponse.h"

@implementation HttpResponse

@synthesize responseData = _responseData;
@synthesize errorText = _errorText;
@synthesize Request;

- (BOOL)getHasError {
    
    return self.errorText != nil;
}
@end
