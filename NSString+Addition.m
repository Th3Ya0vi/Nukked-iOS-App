
#import "NSString+Addition.h"

@implementation NSString(Addition)

-(NSArray *)RangesOfString:(NSString *)sText
{
    NSString *sWord= [NSString stringWithFormat:@"%@",self];
    int iTotalIndex=0;
    NSMutableArray *lstRanges =[NSMutableArray new];
    if(sWord==nil)
        return lstRanges;
 
    while(sWord)
    {
        NSRange range = [sWord  rangeOfString:sText];
        if(range.location != NSNotFound) {
            [lstRanges addObject:[NSValue valueWithRange:NSMakeRange(iTotalIndex+range.location , + range.length)]];
            iTotalIndex+=(range.location + range.length);
            sWord = [sWord substringFromIndex:(range.location + range.length)];
        }else
            sWord=nil;
    }
    return lstRanges;
}

@end
