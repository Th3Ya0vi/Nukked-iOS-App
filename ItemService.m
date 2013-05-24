//
//  ItemService.m
//  Nukkad
//
//  Created by Shiva Srivastava on 4/22/13.
//  Copyright (c) 2013 Fash. All rights reserved.
//

#import "ItemService.h"

@interface ItemService (Private)

- (void) SubmitItemRequestResult: (HttpResponse *) response;
- (void) GetCheapestPriceListRequestResult:(HttpResponse *)response;

@end

@implementation ItemService

@synthesize delegate;

-(void) SubmitItem:(ItemModel *)item
{
    if(item == nil)
    {
        [delegate SubmitItemError:@"SubmitItem Obj is null" AndRequest:nil];
        return;
    }
    
    @try
    {
         NSMutableDictionary *requestHeader = [NSMutableDictionary dictionary];
        [requestHeader setObject:[item objectToJson] forKey:@"sItemModel"];
        
        [HttpRequest sendRequestForController:ITEM_ADD_ITEM_AND_STORE_URL WithValues:requestHeader Method:ITEM_ADD_ITEM_AND_STORE_METHOD target:self
                                     callBack:@selector(SubmitItemRequestResult:)];
    }
     @catch(NSException *exception){
         [delegate SubmitItemError:@"Error: in sSubmitItemQuery" AndRequest:nil];
     }
                                               
}

- (void) SubmitItemRequestResult:(HttpResponse *)response
{
    if(response)
    {
        if([response getHasError])
            [delegate SubmitItemError:response.errorText AndRequest:response.Request];
        else
        {
            [delegate SubmitItemRecieved];
        }
    }
    else{
        [delegate SubmitItemError:UNKNOWN_ERROR_MESSAGE AndRequest:response.Request];
    }
}

- (void) GetCheapestPriceList: (GridQueryModel *) objGridQuery AND: (LocationModel *)objLocation
{
    if(objGridQuery == nil || objLocation == nil)
    {
        [delegate GetCheapestPriceListError:@"GetCheapest objGridQuery or location is null" AndRequest:nil];
        return;
    }
    
    @try
    {
        NSMutableDictionary *requestHeader = [NSMutableDictionary dictionary];
        [requestHeader setObject:[objGridQuery objectToJson] forKey:@"sGridQueryModel"];
        [requestHeader setObject:[objLocation objectToJson] forKey:@"sLocation"];
        [HttpRequest sendRequestForController:ITEM_GET_CHEAPEST_PRICE_URL WithValues:requestHeader Method:ITEM_GET_CHEAPEST_PRICE_METHOD target:self
                                     callBack:@selector(GetCheapestPriceListRequestResult:)];
    }
    @catch(NSException *exception){
        [delegate SubmitItemError:@"Error: in sSearchItemQuery" AndRequest:nil];
    }
}

- (void) GetCheapestPriceListRequestResult:(HttpResponse *)response
{
    if(response)
    {
        if([response getHasError])
            [delegate GetCheapestPriceListError:response.errorText AndRequest:response.Request];
        else
        {
            @try
            {
                NSString *sGridResult = response.responseData;
                
                if(sGridResult==nil||
                   sGridResult.length==0)
                {
                    [delegate GetCheapestPriceListRecieved:[NSMutableArray new]];
                    return;
                }
                
                GridResultModel *objResult =(GridResultModel *)[GridResultModel objectForJSON:sGridResult];
                
                NSString *sItemModels = objResult.ResultJson;
                
                NSDictionary *objItemsDic = [sItemModels JSONValue];
                NSMutableArray *lstItems = [NSMutableArray new];
                for (NSDictionary *objItemDic in objItemsDic)
                {
                    ItemModel *item=(ItemModel *)[ItemModel objectForDictionary:objItemDic];
                    [lstItems addObject:item];
                }
                
                [delegate GetCheapestPriceListRecieved:lstItems];
                
            }
            @catch (NSException *exception)
            {
                [delegate GetCheapestPriceListError:UNKNOWN_ERROR_MESSAGE AndRequest:response.Request];
            }
        }
    }else
        [delegate GetCheapestPriceListError:UNKNOWN_ERROR_MESSAGE AndRequest:response.Request];
}
@end
