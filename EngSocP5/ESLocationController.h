//
//  ESLocationController.h
//  EngSocP5
//
//  Created by Nik Klassen on 2013-10-04.
//  Copyright (c) 2013 Farwa Naqi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ESLocationControllerDelegate
@required
- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;
@end

@interface ESLocationController : NSObject <CLLocationManagerDelegate> {
    CLLocationManager *m_locationManager;
}

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, assign) id delegate;

- (void)locationManager:(CLLocationManager *) manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation;

- (void) locationManager:(CLLocationManager *) manager
        didFailWithError:(NSError *) error;

@end