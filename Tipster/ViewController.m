//
//  ViewController.m
//  Tipster
//
//  Created by Miguel Batilando on 5/19/19.
//  Copyright © 2019 Miguel Batilando. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *billLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTextLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Tipster";
    [_billField becomeFirstResponder];
    
    // Restore last session
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int lastSessionTime = [defaults integerForKey:@"lastCalculationTime"];
    int currentTime = [[NSDate date] timeIntervalSince1970];
//    NSLog(@"lastSessionTime = %i", lastSessionTime);
//    NSLog(@"currentTime = %f", currentTime);
    int timeSinceLast = currentTime - lastSessionTime;
    if (timeSinceLast < 600) {
        // Set bill to default
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = [defaults doubleForKey:@"default_tip_percentage"];
    
    if (doubleValue == 0.15) {
        self.tipControl.selectedSegmentIndex = 0;
    } else if (doubleValue == 0.2) {
        self.tipControl.selectedSegmentIndex = 1;
    } else {
        self.tipControl.selectedSegmentIndex = 2;
    }
    
    double bill = [self.billField.text doubleValue];
    NSArray *percentages = @[@(0.15), @(0.20), @(0.22)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.billLabel.alpha = 0;
    self.tipTextLabel.alpha = 0;
    self.totalTextLabel.alpha = 0;
    self.tipControl.alpha = 0;
    self.tipLabel.text = [NSString stringWithFormat: @"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat: @"$%.2f", total];
    
//    NSLog(@"View will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

//    NSLog(@"View did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
//    NSLog(@"View will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
//    NSLog(@"View did disappear");
}

- (IBAction)onTap:(id)sender {
//    NSLog(@"Hello");
    [self.view endEditing:(YES)];
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    NSArray *percentages = @[@(0.15), @(0.20), @(0.22)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat: @"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat: @"$%.2f", total];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int currentTime = [[NSDate date] timeIntervalSince1970];
    [defaults setInteger:currentTime forKey:(@"lastCalculationTime")];
    [defaults synchronize];
}

- (IBAction)onEditingBegin:(id)sender {
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x,
                                          self.billField.frame.origin.y - 320,
                                          self.billField.frame.size.width,
                                          self.billField.frame.size.height);
        self.tipControl.frame = CGRectMake(self.tipControl.frame.origin.x,
                                           self.tipControl.frame.origin.y - 320,
                                           self.tipControl.frame.size.width,
                                           self.tipControl.frame.size.height);
        self.tipLabel.frame = CGRectMake(self.tipLabel.frame.origin.x,
                                           self.tipLabel.frame.origin.y - 320,
                                           self.tipLabel.frame.size.width,
                                           self.tipLabel.frame.size.height);
        self.totalLabel.frame = CGRectMake(self.totalLabel.frame.origin.x,
                                           self.totalLabel.frame.origin.y - 320,
                                           self.totalLabel.frame.size.width,
                                           self.totalLabel.frame.size.height);
        self.billLabel.frame = CGRectMake(self.billLabel.frame.origin.x,
                                           self.billLabel.frame.origin.y - 320,
                                           self.billLabel.frame.size.width,
                                           self.billLabel.frame.size.height);
        self.tipTextLabel.frame = CGRectMake(self.tipTextLabel.frame.origin.x,
                                         self.tipTextLabel.frame.origin.y - 320,
                                         self.tipTextLabel.frame.size.width,
                                         self.tipTextLabel.frame.size.height);
        self.totalTextLabel.frame = CGRectMake(self.totalTextLabel.frame.origin.x,
                                           self.totalTextLabel.frame.origin.y - 320,
                                           self.totalTextLabel.frame.size.width,
                                           self.totalTextLabel.frame.size.height);
        
        self.billLabel.alpha = 1;
        self.tipTextLabel.alpha = 1;
        self.totalTextLabel.alpha = 1;
        self.tipControl.alpha = 1;
    }];
}

- (IBAction)onEditingEnd:(id)sender {
    CGRect billFieldNewFrame = self.billField.frame;
    CGRect tipControlNewFrame = self.tipControl.frame;
    CGRect tipNewFrame = self.tipLabel.frame;
    CGRect totalNewFrame = self.totalLabel.frame;
    CGRect billLabelFrame = self.billLabel.frame;
    CGRect tipTextLabelFrame = self.tipTextLabel.frame;
    CGRect totalTextLabelFrame = self.totalTextLabel.frame;
    
    billFieldNewFrame.origin.y += 320;
    tipControlNewFrame.origin.y += 320;
    tipNewFrame.origin.y += 320;
    totalNewFrame.origin.y += 320;
    billLabelFrame.origin.y += 320;
    tipTextLabelFrame.origin.y += 320;
    totalTextLabelFrame.origin.y += 320;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = billFieldNewFrame;
        self.tipControl.frame = tipControlNewFrame;
        self.tipLabel.frame = tipNewFrame;
        self.totalLabel.frame = totalNewFrame;
        self.billLabel.frame = billLabelFrame;
        self.tipTextLabel.frame = tipTextLabelFrame;
        self.totalTextLabel.frame = totalTextLabelFrame;
    }];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billLabel.alpha = 0;
        self.tipTextLabel.alpha = 0;
        self.totalTextLabel.alpha = 0;
        self.tipControl.alpha = 0;
    }];
}

@end
