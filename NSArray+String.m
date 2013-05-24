//
//  NASArray+String.m
//  EGOTextView_Demo
//
//  Created by Faraj Khasib on 11/5/12.
//
//

#import "NSArray+String.h"

@implementation NSArray(Addition)
-(BOOL)ContainsString:(NSString *)sWord
{
    if(sWord==nil||
       sWord.length==0)
        return NO;
    
    for (NSString* item in self)
        if ([[item lowercaseString]
             isEqualToString:[sWord lowercaseString]])
            return YES;
    return NO;
}
@end
