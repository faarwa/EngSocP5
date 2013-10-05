//
//  ESParticipationViewController.m
//  EngSocP5
//
//  Created by Farwa Naqi on 2013-10-04.
//  Copyright (c) 2013 Farwa Naqi. All rights reserved.
//

#import "ESParticipationViewController.h"

@interface ESParticipationViewController ()
{
    NSArray *m_data;
}
@end

@implementation ESParticipationViewController

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
    [self.pointsTableView setDelegate:self];
    [self.pointsTableView setDataSource:self];
    [self.eventsKeyField setDelegate:self];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    [self getData];
	// Do any additional setup after loading the view.
}

-(void)dismissKeyboard
{
    [self.eventsKeyField resignFirstResponder];
}

-(void)getData
{
    NSURL *url = [NSURL URLWithString:@"http://www.thekev.in/P5/webapi.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                       timeoutInterval:10];
    NSString *requestString = @"requesttype=get";
    NSData *data = [NSData dataWithBytes:[requestString UTF8String] length:[requestString length]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [request setHTTPBody:data];
    NSError *requestError;
    NSURLResponse *response = nil;
    NSData *returnData = [NSURLConnection sendSynchronousRequest: request returningResponse:&response error:&requestError];
    m_data = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:&requestError];
    [self sortData];
    NSLog(@"%@", m_data);
}

-(void) sortData
{
    NSArray *temp = m_data;
    for (NSDictionary *dict in temp)
    {
        // sorting code here
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    NSDictionary *dict = [m_data objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%@ %@ - %@ points", [dict objectForKey:@"CLASS"], [dict objectForKey:@"YEAR"], [dict objectForKey:@"POINTS"]]];
    [cell.textLabel setNumberOfLines:0];
    [cell.textLabel setLineBreakMode:NSLineBreakByWordWrapping];
//    NSLog(@"%@", [m_data objectAtIndex:indexPath.row]);
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [m_data count];
}

- (IBAction)updatePoints:(id)sender
{
    if ([self.eventsKeyField isFirstResponder])
    {
        [self.eventsKeyField resignFirstResponder];
    }
    [self getData];
    [self.pointsTableView reloadData];
}
@end
