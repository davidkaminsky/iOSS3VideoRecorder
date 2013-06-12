//
//  iOSS3VideoRecorder.h
//  iOSS3VideoRecorder
//
//  Created by David Kaminsky on 6/11/13.
//  Copyright (c) 2013 David Kaminsky. All rights reserved.
//

#import <AWSS3/AWSS3.h>
#import <Foundation/Foundation.h>

@interface iOSS3VideoRecorder : NSObject<UIImagePickerControllerDelegate, UINavigationControllerDelegate, AmazonServiceRequestDelegate> {
@private UIImagePickerController* picker;
@private NSString* ACCESS_KEY;
@private NSString* SECRET_KEY;
@private NSString* BUCKET_NAME;
@private NSString* FILE_NAME;
}

@property (retain, strong, atomic) UIViewController* viewController;
@property (nonatomic, retain) AmazonS3Client *s3;

//- (void)initWithCredentials:(NSString*)

- (id)init;

- (void)showVideoRecorder;

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;

@end
