//
//  ESViewController.m
//  EngSocP5
//
//  Created by Farwa Naqi on 2013-10-04.
//  Copyright (c) 2013 Farwa Naqi. All rights reserved.
//

#import "MultiFormatReader.h"
#import "ESViewController.h"

@implementation ESViewController

@synthesize locationLabel = m_locationLabel, resultLabel = m_resultLabel;
@synthesize questIdField, eventKeyField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

    m_locationController = [[ESLocationController alloc] init];
    m_locationController.delegate = self;
    [m_locationController.locationManager startUpdatingLocation];
}

#pragma mark Location delegate
- (void) locationUpdate:(CLLocation *)location {
    m_locationLabel.text = [location description];
}

- (void) locationError:(NSError *)error {
    m_locationLabel.text = [error description];
}

#pragma mark Text field delegate
- (void) dismissKeyboard {
    [questIdField resignFirstResponder];
    [eventKeyField resignFirstResponder];
}

- (BOOL) textFieldShouldReturn:(UITextField *) textField {

    if( textField == questIdField ) {
        [eventKeyField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return NO;
}

#pragma mark QR Code thing
- (IBAction)scanPressed:(id)sender {
	
    ZXingWidgetController *widController =
    [[ZXingWidgetController alloc] initWithDelegate: self
                                         showCancel: YES
                                           OneDMode: NO];
    
    NSMutableSet *readers = [[NSMutableSet alloc ] init];
    
    MultiFormatReader* reader = [[MultiFormatReader alloc] init];
    [readers addObject:reader];
    
    widController.readers = readers;
    
    [self presentViewController: widController
                       animated: YES
                     completion: nil];
}

#pragma mark -
#pragma mark Delegates
#pragma mark ZXingDelegateMethods

- (void) zxingController: (ZXingWidgetController *) controller
           didScanResult: (NSString *) result {
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
    [m_resultLabel setText: [@"Link = " stringByAppendingString: result]];
}

- (void) zxingControllerDidCancel: (ZXingWidgetController *) controller {
    [self dismissViewControllerAnimated: YES
                             completion: nil];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
