//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by David Lin on 12/11/13.
//  Copyright (c) 2013 David Lin. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
- (IBAction)onTap:(id)sender;
- (void)updateSelection;

@end

@implementation SettingsViewController

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
    // Do any additional setup after loading the view from its nib.
    float defaultTip = [self getDefaultTip];
    self.tipControl.selectedSegmentIndex = defaultTip;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (float)getDefaultTip {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float defaultTip = [defaults floatForKey:@"defaultTip"];
    return defaultTip;
}

- (void)setDefaultTip:(float)defaultTip {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:defaultTip forKey:@"defaultTip"];
    [defaults synchronize];
}

- (IBAction)onTap:(id)sender {
    [self updateSelection];
}

- (void)updateSelection {
    [self setDefaultTip:self.tipControl.selectedSegmentIndex];
}

@end
