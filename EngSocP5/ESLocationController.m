//
//  ESLocationController.m
//  EngSocP5
//
//  Created by Nik Klassen on 2013-10-04.
//  Copyright (c) 2013 Farwa Naqi. All rights reserved.
//

#import "ESLocationController.h"

@implementation ESLocationController

@synthesize locationManager = m_locationManager;
@synthesize delegate;

- (id) init {
    self = [super init];
    if (self != nil) {
        m_locationManager = [[CLLocationManager alloc] init];
        m_locationManager.delegate = self; // send loc updates to myself
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    
    [self.delegate locationUpdate: newLocation];
    
//    NSLog(@"Location: %@", [newLocation description]);
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    
    [self.delegate locationError: error];
    
	NSLog(@"Error: %@", [error description]);
}

@end
