
#import "KVCBaseObject.h"

@interface LocationModel : KVCBaseObject

@property(nonatomic,strong)NSString *XCoordinates;
@property(nonatomic,strong)NSString *YCoordinates;
@property(nonatomic,strong)NSString *Radius;

@end
/*
 public String XCoordinates { get; set; }
 public String YCoordinates { get; set; }
 public String Raduis { get; set; }
 */