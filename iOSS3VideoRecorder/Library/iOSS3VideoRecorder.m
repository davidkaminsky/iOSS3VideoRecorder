//
//  iOSS3VideoRecorder.m
//  iOSS3VideoRecorder
//
//  Created by David Kaminsky on 6/11/13.
//  Copyright (c) 2013 David Kaminsky. All rights reserved.
//

#import <AWSRuntime/AWSRuntime.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "iOSS3VideoRecorder.h"
#import "Reachability.h"
#import "../Settings.h"

const int PART_SIZE = (5 * 1024 * 1024); // 5MB is the smallest part size allowed for a multipart upload. (Only the last part can be smaller.)

@implementation iOSS3VideoRecorder

@synthesize viewController;
@synthesize s3 = _s3;

- (id)init {
    self = [super init];
    if(self) {
        picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeMovie];
        picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
        picker.delegate = self;
        
        ACCESS_KEY = [NSString stringWithFormat:@"%@", AWSAccessKey];
        SECRET_KEY = [NSString stringWithFormat:@"%@", AWSSecretKey];
        BUCKET_NAME = [NSString stringWithFormat:@"%@", BucketName];
        FILE_NAME = [NSString stringWithFormat:@"%@", FileName];
        
        if(self.s3 == nil) {
            self.s3 = [[AmazonS3Client alloc] initWithAccessKey:ACCESS_KEY withSecretKey:SECRET_KEY];
            self.s3.endpoint = [AmazonEndpoints s3Endpoint:US_EAST_1];
        }

    }
    return self;
}

- (void)showVideoRecorder {
    [self.viewController presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSURL *url = [info valueForKey:@"UIImagePickerControllerMediaURL"];
    NSData *video = [[NSFileManager defaultManager] contentsAtPath:[url path]];
    [self uploadVideo:video];
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)uploadVideo:(NSData*)videoData {
    S3PutObjectRequest *por = [[S3PutObjectRequest alloc] initWithKey:FILE_NAME
                                                              inBucket:BUCKET_NAME];
    por.contentType = @"video/mp4";
    por.data = videoData;
    por.delegate = self;
    
    // Put the image data into the specified s3 bucket and object.
    [self.s3 putObject:por];
}

@end
