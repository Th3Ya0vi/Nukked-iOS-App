//
//  ItemService.h
//  Nukkad
//
//  Created by Shiva Srivastava on 4/22/13.
//  Copyright (c) 2013 Fash. All rights reserved.
//

#import <Foundation/Foundation.h>



#import <Foundation/Foundation.h>

#import "HttpRequest.h"
#import "ItemModel.h"
#import "GridQueryModel.h"
#import "GridResultModel.h"

@protocol ItemServiceDelegate <NSObject>
@optional

- (void) SubmitItemRecieved;
- (void) SubmitItemError: (NSString *) sErrorString AndRequest: (HttpRequest *) objRequest;
- (void) GetCheapestPriceListRecieved: (NSMutableArray *) lstItems;
- (void) GetCheapestPriceListError:(NSString *) sErrorString AndRequest: (HttpRequest *) objRequest;
@end

@interface ItemService : NSObject
{
    id <ItemServiceDelegate> delegate ;
}

@property (nonatomic, strong) id <ItemServiceDelegate> delegate ;

- (void) SubmitItem: (ItemModel *) item;
- (void) GetCheapestPriceList: (GridQueryModel *) objGridQuery AND: (LocationModel *)objLocation;

@end
