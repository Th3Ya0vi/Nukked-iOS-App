//
//  AddItemViewController.h
//  Nukkad
//
//  Created by Shiva Srivastava on 4/22/13.
//  Copyright (c) 2013 Fash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "UIGeneralViewController.h"
#import "ItemService.h"
#import "StoreModel.h"
#import "ItemModel.h"

@interface AddItemViewController : UIGeneralViewController <CLLocationManagerDelegate,ItemServiceDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblStoreInfo;
@property (strong, nonatomic) StoreModel * Store;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLGeocoder *geocoder;
@property (strong, nonatomic) CLPlacemark *placemark;

@property (weak, nonatomic) IBOutlet UITextField *txtItemName;
@property (weak, nonatomic) IBOutlet UITextField *txtPrice;

@property (weak, nonatomic) IBOutlet UITextField *txtStoreName;
@property (weak, nonatomic) IBOutlet UITextField *txtStoreAddress;
- (IBAction)btnHomeClick:(id)sender;

- (IBAction)btnSubmitItem:(id)sender;
- (IBAction)resignFirstResponderClick:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end