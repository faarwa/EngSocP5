//
//  ESViewController.m
//  EngSocP5
//
//  Created by Farwa Naqi on 2013-10-04.
//  Copyright (c) 2013 Farwa Naqi. All rights reserved.
//

#import "ESViewController.h"

@implementation ESViewController

@synthesize locationLabel = m_locationLabel;
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
