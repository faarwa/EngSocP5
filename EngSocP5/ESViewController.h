//
//  ESViewController.h
//  EngSocP5
//
//  Created by Farwa Naqi on 2013-10-04.
//  Copyright (c) 2013 Farwa Naqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESLocationController.h"
#import "ZXingWidgetController.h"

@interface ESViewController : UIViewController <ESLocationControllerDelegate, UITextFieldDelegate, ZXingDelegate> {
    ESLocationController *m_locationController;
    UILabel *m_locationLabel, *m_resultLabel;
}

@property (nonatomic) IBOutlet UILabel *locationLabel, *resultLabel;
@property (nonatomic) IBOutlet UITextField *questIdField, *eventKeyField;

- (void) locationUpdate:(CLLocation *)location;
- (void) locationError:(NSError *)error;

- (IBAction) scanPressed:(id)sender;

@end
