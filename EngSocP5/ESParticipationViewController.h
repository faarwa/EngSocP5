//
//  ESParticipationViewController.h
//  EngSocP5
//
//  Created by Farwa Naqi on 2013-10-04.
//  Copyright (c) 2013 Farwa Naqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESParticipationViewController : UIViewController <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *pointsTableView;
@property (weak, nonatomic) IBOutlet UITextField *eventsKeyField;
- (IBAction)updatePoints:(id)sender;


@end
