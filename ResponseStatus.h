/*
 ERROR = 0,
 SUCCESS = 1,
 WRONGUSERNAMEORPASSWOR = 2,
 WRONGTOKENID = 3,
 ERRORWITHMESSAGE=4
 */
typedef enum ResponseStatusCodeValues
{
    ERROR=0,
    SUCCESS=1,
    WRONGUSERNAMEORPASSWORD=2,
    WRONGTOKENID=3,
    ERRORWITHMESSAGE=4
} ResponseState;

#import <Foundation/Foundation.h>
#import "KVCBaseObject.h"

@interface ResponseStatus : KVCBaseObject {
    
}
@property(nonatomic,assign)ResponseState ResponseStatusCode;
@property(nonatomic,strong)NSString *Data;

@end
