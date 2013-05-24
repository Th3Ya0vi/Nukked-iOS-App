//
//  FindItemViewController.m
//  Nukkad
//
//  Created by Shiva Srivastava on 4/23/13.
//  Copyright (c) 2013 Fash. All rights reserved.
//

#import "FindItemViewController.h"

@interface FindItemViewController ()

@end

@implementation FindItemViewController

@synthesize txtSearchItemName, txtRadius, Usrlocation, lstItems, locationManager, storeResultTableView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    Usrlocation = [LocationModel new];
    [locationManager startUpdatingLocation];
}

- (IBAction)btnFindCheapPrice:(id)sender {
    [self ResignFirstResponder];
    lstItems = [[NSMutableArray alloc] init];
    
    Usrlocation.Radius = txtRadius.text;

    GridQueryModel *objQuery = [GridQueryModel new];
    objQuery.Search = txtSearchItemName.text;
    
    ItemService *objItemService = [ItemService new];
    objItemService.delegate = self;
    [objItemService GetCheapestPriceList:objQuery AND:Usrlocation];
    [self ShowLoadingView];
}

- (void) GetCheapestPriceListRecieved: (NSMutableArray *) items;
{
    [self HideLoadingView];
    self.lstItems = items;
    if(self.lstItems.count == 0)
    {
        [self ShowAlertView:@"This item was not found"];
        return;
    }
    
    [self.storeResultTableView reloadData];
}

-(void)GetCheapestPriceListError:(NSString *)sErrorString AndRequest:(HttpRequest *)objRequest
{
    [self HideLoadingView];
    [self ShowAlertView:sErrorString];

}
- (IBAction)ResignFirstResponderClick:(id)sender {
    [self ResignFirstResponder];
}

- (void) ResignFirstResponder{
    [txtSearchItemName resignFirstResponder];
    [txtRadius resignFirstResponder];
}

#pragma - Table View Methods

- (NSInteger) numberOfSectionsInTableView: (UITableView *) tableView
{
    return 1;
}

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection:(NSInteger) section
{
    return lstItems.count;
}

- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    FindItemResultCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
    ItemModel *thisItem = (ItemModel *) [lstItems objectAtIndex:indexPath.row];
    cell.lblPrice.text = [NSString stringWithFormat:@"$%@",thisItem.Price];
    cell.lblStoreName.text = [NSString stringWithFormat:@"%@ ( %@ )",thisItem.StoreName, thisItem.Name];
    cell.lblStoreAddress.text = thisItem.StoreDescirption;
    
    return cell;
}
- (IBAction)btnHomeClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        Usrlocation.YCoordinates = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        Usrlocation.XCoordinates = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
    [locationManager stopUpdatingLocation];
}

 @end
