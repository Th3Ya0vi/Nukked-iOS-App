//
//  AddItemViewController.m
//  Nukkad
//
//  Created by Shiva Srivastava on 4/22/13.
//  Copyright (c) 2013 Fash. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController 

@synthesize lblStoreInfo, locationManager, geocoder, placemark, Store, txtItemName, txtPrice, txtStoreAddress, txtStoreName;

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
    geocoder = [[CLGeocoder alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    Store = [StoreModel new];
    [locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)GetStore{
    
}

- (IBAction)btnHomeClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)btnSubmitItem:(id)sender {
    
    Store.StoreName = txtStoreName.text;
    Store.Address = txtStoreAddress.text;
    
    ItemModel *objItem = [ItemModel new];
    objItem.Name = txtItemName.text;
    objItem.BarCode = @"1234";  // dummy value used untill barcode scanner included
    objItem.price = txtPrice.text;
    objItem.StoreName = Store.StoreName;
    
    objItem.StoreDescirption = Store.Address;
    LocationModel *objLocationModel = [LocationModel new];
    objLocationModel.XCoordinates = Store.Latitude;
    objLocationModel.YCoordinates = Store.Longitude;
    objItem.Location = objLocationModel;
    ItemService *objItemService = [ItemService new];
    objItemService.delegate = self;
    [objItemService SubmitItem:objItem];
    [self ShowLoadingView];
}

- (void) SubmitItemRecieved
{
    [self HideLoadingView];
    [self ShowAlertView:@"Item successfully added"];
    [self dismissViewControllerAnimated:YES completion:NULL];
    return;
}

-(void)SubmitItemError:(NSString *)sErrorString AndRequest:(HttpRequest *)objRequest
{
    [self HideLoadingView];
    [self ShowAlertView:sErrorString];
}

- (IBAction)resignFirstResponderClick:(id)sender {
    
    [txtItemName resignFirstResponder];
    [txtPrice resignFirstResponder];
    [txtStoreName resignFirstResponder];
    [txtStoreAddress resignFirstResponder];
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
        Store.Longitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        Store.Latitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
    
    // Reverse Geocoding
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            txtStoreAddress.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                 placemark.subThoroughfare, placemark.thoroughfare,
                                 placemark.postalCode, placemark.locality,
                                 placemark.administrativeArea,
                                 placemark.country];
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
    [locationManager stopUpdatingLocation];
}

@end
