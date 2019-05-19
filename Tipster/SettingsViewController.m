//
//  SettingsViewController.m
//  Tipster
//
//  Created by Miguel Batilando on 5/19/19.
//  Copyright © 2019 Miguel Batilando. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *fifteenPercentButton;
@property (weak, nonatomic) IBOutlet UIButton *twentyPercentButton;
@property (weak, nonatomic) IBOutlet UIButton *twentyTwoPercentButton;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)didTapFifteen:(id)sender {
    NSLog(@"15");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:0.15 forKey:@"default_tip_percentage"];
    [defaults synchronize];
}
- (IBAction)didTapTwenty:(id)sender {
    NSLog(@"20");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:0.2 forKey:@"default_tip_percentage"];
    [defaults synchronize];
}
- (IBAction)didTapTwentyTwo:(id)sender {
    NSLog(@"22");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:0.22 forKey:@"default_tip_percentage"];
    [defaults synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
