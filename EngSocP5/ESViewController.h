//
//  ESViewController.h
//  EngSocP5
//
//  Created by Farwa Naqi on 2013-10-04.
//  Copyright (c) 2013 Farwa Naqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESLocationController.h"

@interface ESViewController : UIViewController <ESLocationControllerDelegate, UITextFieldDelegate> {
    ESLocationController *m_locationController;
    UILabel *m_locationLabel;
}

@property (nonatomic) IBOutlet UILabel *locationLabel;
@property (nonatomic) IBOutlet UITextField *questIdField, *eventKeyField;

- (void) locationUpdate:(CLLocation *)location;
- (void) locationError:(NSError *)error;

@end
