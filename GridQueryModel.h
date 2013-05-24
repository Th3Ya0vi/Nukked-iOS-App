
#import "KVCBaseObject.h"

@interface GridQueryModel : KVCBaseObject

@property(nonatomic,strong)NSString *Search;
@property(nonatomic,strong)NSString *Take;
@property(nonatomic,strong)NSString *Skip;
@property(nonatomic,strong)NSString *Sort;
@property(nonatomic,strong)NSString *Direction;

@end
