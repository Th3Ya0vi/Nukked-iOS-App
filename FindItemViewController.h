//
//  FindItemViewController.h
//  Nukkad
//
//  Created by Shiva Srivastava on 4/23/13.
//  Copyright (c) 2013 Fash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "UIGeneralViewController.h"
#import "StoreModel.h"
#import "ItemModel.h"
#import "ItemService.h"
#import "FindItemResultCell.h"

@interface FindItemViewController : UIGeneralViewController
<CLLocationManagerDelegate, ItemServiceDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtSearchItemName;

- (IBAction)btnFindCheapPrice:(id)sender;
- (IBAction)ResignFirstResponderClick:(id)sender;

@property(strong,nonatomic)NSMutableArray *lstItems;
@property (strong, nonatomic) LocationModel * Usrlocation;
@property (weak, nonatomic) IBOutlet UITextField *txtRadius;

@property (strong, nonatomic) CLLocationManager *locationManager;

- (IBAction)btnHomeClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *storeResultTableView;

@end
