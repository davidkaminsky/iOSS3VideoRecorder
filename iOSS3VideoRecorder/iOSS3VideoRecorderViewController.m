//
//  iOSS3VideoRecorderViewController.m
//  iOSS3VideoRecorder
//
//  Created by David Kaminsky on 6/11/13.
//  Copyright (c) 2013 David Kaminsky. All rights reserved.
//

#import "iOSS3VideoRecorderViewController.h"

@interface iOSS3VideoRecorderViewController ()

@end

@implementation iOSS3VideoRecorderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    recorder = [[iOSS3VideoRecorder alloc] init];
    recorder.viewController = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showVideoRecorder:(id)sender {
    [recorder showVideoRecorder];
}
@end
