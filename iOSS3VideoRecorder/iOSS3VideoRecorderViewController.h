//
//  iOSS3VideoRecorderViewController.h
//  iOSS3VideoRecorder
//
//  Created by David Kaminsky on 6/11/13.
//  Copyright (c) 2013 David Kaminsky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iosS3VideoRecorder.h"

@interface iOSS3VideoRecorderViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    @private iOSS3VideoRecorder* recorder;
}
- (IBAction)showVideoRecorder:(id)sender;

@end
