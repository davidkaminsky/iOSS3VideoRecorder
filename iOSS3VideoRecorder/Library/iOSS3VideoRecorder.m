//
//  iOSS3VideoRecorder.m
//  iOSS3VideoRecorder
//
//  Created by David Kaminsky on 6/11/13.
//  Copyright (c) 2013 David Kaminsky. All rights reserved.
//

#import "iOSS3VideoRecorder.h"
#import <MobileCoreServices/MobileCoreServices.h>

@implementation iOSS3VideoRecorder

@synthesize viewController;

- (id)init {
    self = [super init];
    if(self) {
        picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeMovie];
        picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
        picker.delegate = self;
    }
    return self;
}

- (void)showVideoRecorder {
    [self.viewController presentViewController:picker animated:YES completion:nil];
}

@end
