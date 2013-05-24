
#import "HttpRequest.h"

@interface HttpRequest (Private)

- (void)performCallBack: (HttpResponse *)response;
- (void)sendRequestForController: (NSString *)url
                      WithValues: (NSDictionary *)headers
                          Method:(NSString *)method
                          target: (NSObject *)target
                        callBack: (SEL)callBack;
-(NSString *)GetTokenID;
-(void)PerformWrongTokenID;

@end

@implementation HttpRequest
@synthesize Request;
+ (void)sendRequestForController: (NSString *)url
                      WithValues: (NSDictionary *)headers
                          Method:(NSString *)method
                          target: (NSObject *)target
                        callBack: (SEL)callBack
{
    HttpRequest *request =[[HttpRequest alloc] init];
    [request sendRequestForController:url WithValues:headers Method:method target:target callBack:callBack];
}

- (void)sendRequestForController: (NSString *)url
                      WithValues: (NSDictionary *)headers
                          Method:(NSString *)method
                          target: (NSObject *)target
                        callBack: (SEL)callBack
{
    
    _target = target;
    _callBack = callBack;
    _responseBody = [NSMutableData data];
    url = [NSString stringWithFormat:@"%@%@",SERVER_URL,url];
    
    NSMutableString *sParamters = [NSMutableString new];
    if (headers)
    {
        for (NSString* key in headers)
        {
            [sParamters appendFormat:@"%@=%@&",key,[headers objectForKey:key]];
        }
    }
    NSString *tokenID = [self GetTokenID];
    if(tokenID)
        [sParamters appendFormat:@"%@=%@",@"AccessToken",tokenID];
    
    NSMutableURLRequest *request;
    if(method)
    {
        if([method isEqualToString:GET_METHOD])
        {
            if(sParamters&&[sParamters length]!=0)
                url = [NSString stringWithFormat:@"%@?%@",url,sParamters ];
            request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString: [[url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding] stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"]]];
        }else
        {
            request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString: url]];
            [request setHTTPBody:[[sParamters stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"]dataUsingEncoding:NSUTF8StringEncoding]];
        }
        [request setHTTPMethod: method];
        
    }else
        [[[NSException alloc] initWithName:@"Request" reason:@"UnknownMethod" userInfo:nil]raise];
    
	
#ifdef CONNECTION_ALLOW_ANY_HTTPS_CERTIFICATE
    [NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[[NSURL URLWithString: url] host]];
    
#endif
    
    self.Request = request;
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest: request delegate: self];
    [connection start];
}

#pragma mark Connection Events

- (void)connection: (NSURLConnection *)connection didReceiveResponse: (NSURLResponse *)response {
    
    if (_responseBody) {
        [_responseBody setLength: 0];
    }
}

- (void)connection: (NSURLConnection *)conn didReceiveData: (NSData *)data {
    
    if (_responseBody && data) {
        [_responseBody appendData: data];
    }
}

- (void)connectionDidFinishLoading: (NSURLConnection *)conn 
{
    
    NSString *responseString = [[NSString alloc] initWithData: _responseBody encoding: NSUTF8StringEncoding];
    HttpResponse *response = [HttpResponse new];
    response.Request = self;
    @try{
       
        
        if(responseString==nil)
            [[[NSException alloc] initWithName:@"Response" 
                                        reason:@"UNKNown Response" userInfo:nil] raise];
        ResponseStatus *responseStatus =(ResponseStatus *) [ResponseStatus objectForJSON:responseString];
        /*
         ERROR = 0,
         SUCCESS = 1,
         WRONGUSERNAMEORPASSWOR = 2,
         WRONGTOKENID = 3,
         ERRORWITHMESSAGE=4
         */
        switch (responseStatus.ResponseStatusCode) 
        {
            case ERROR:
                response.errorText = SERVER_ERROR_MESSAGE;
                break;
            case WRONGUSERNAMEORPASSWORD :
                response.errorText = WRONG_USERNAME_PASSWORD_MESSAGE;
                break;
            case WRONGTOKENID :
                [self PerformWrongTokenID];
                break;
            case SUCCESS:
                response.responseData = responseStatus.Data;
                break;
            case ERRORWITHMESSAGE:
                response.errorText = responseStatus.Data;
                break;

            default:
                response.errorText = UNKNOWN_ERROR_MESSAGE;
                break;
        }
    }
    @catch (NSException *exception) 
    {
        response.errorText =UNKNOWN_ERROR_MESSAGE;
    }
    [self performCallBack: response];
}

- (void)connection: (NSURLConnection *)conn didFailWithError: (NSError *)error {
    
    HttpResponse *response = [HttpResponse new];
    response.Request = self;
    response.errorText = FAILED_TO_CONNECT_MESSAGE;
    [self performCallBack: response];
}

#pragma mark Connection Events End

- (void)performCallBack: (HttpResponse *)response {
    
    if (_target && [_target respondsToSelector: _callBack]) {
        
        [_target performSelector:_callBack withObject:response];
    }
}

-(NSString *)GetTokenID
{
    return nil;
}

-(void)RetryRequest
{
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest: self.Request delegate: self];
    [connection start];
}
@end
