//
//  StoreModel.h
//  Nukkad
//
//  Created by Shiva Srivastava on 4/23/13.
//  Copyright (c) 2013 Fash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVCBaseObject.h"

@interface StoreModel : KVCBaseObject
@property(nonatomic,strong)NSString *Latitude;
@property(nonatomic,strong)NSString *Longitude;
@property(nonatomic,strong)NSString *Address;
@property(nonatomic, strong)NSString *StoreName;
@end
