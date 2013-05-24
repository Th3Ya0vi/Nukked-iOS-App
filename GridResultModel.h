
#import "KVCBaseObject.h"

@interface GridResultModel : KVCBaseObject

@property(nonatomic,assign)long long TotalSize;
@property(nonatomic,strong)NSString *ResultJson;

@end
/*
 public long TotalSize { get; set; }
 public String ResultJson { get; set; }
 */