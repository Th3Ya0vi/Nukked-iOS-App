
#import <Foundation/Foundation.h>
#import "SBJson.h"
#import "HttpResponse.h"
#import "ResponseStatus.h"
#import "GeneralConstants.h"

@interface HttpRequest : NSObject{
    
    NSMutableData *_responseBody;
    NSObject *_target;
    SEL _callBack;
    NSURLRequest *Request;
}
@property(nonatomic,strong)NSURLRequest *Request;
+ (void)sendRequestForController: (NSString *)url
                 WithValues: (NSDictionary *)headers
                          Method:(NSString *)method
                   target: (NSObject *)target
 
                        callBack: (SEL)callBack;
-(void)RetryRequest;

@end
