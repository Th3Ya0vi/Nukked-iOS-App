
#import <Foundation/Foundation.h>

@interface GeneralLogic : NSObject

+(BOOL)IsValidEmail:(NSString *)checkString;
+ (NSDate *)GetGMTDate:(NSDate *)sourceDate;

@end
