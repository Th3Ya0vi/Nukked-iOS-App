

#import <Foundation/Foundation.h>
#import "LocationModel.h"
#import "KVCBaseObject.h"

@interface ItemModel : KVCBaseObject

@property(nonatomic,strong)NSString *BarCode;
@property(nonatomic,strong)NSString *Name;
@property(nonatomic,strong)NSString *Description;
@property(nonatomic,strong)NSString *Price;
@property(nonatomic,strong)NSString *StoreName;
@property(nonatomic,strong)NSString *StoreDescirption;
@property(nonatomic,strong)LocationModel *Location;

@end
