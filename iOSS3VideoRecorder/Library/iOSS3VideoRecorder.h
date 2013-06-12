//
//  iOSS3VideoRecorder.h
//  iOSS3VideoRecorder
//
//  Created by David Kaminsky on 6/11/13.
//  Copyright (c) 2013 David Kaminsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iOSS3VideoRecorder : NSObject<UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
@private UIImagePickerController* picker;
}

@property (retain, strong, atomic) UIViewController* viewController;

//- (void)initWithCredentials:(NSString*)

- (id)init;

- (void)showVideoRecorder;

@end
