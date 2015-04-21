//
//  ViewController.h
//  weather
//
//  Created by Ilya Bukonkin on 4/13/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet __weak UITextField             *longitudeTextField;
    IBOutlet __weak UITextField             *latitudeTextFiled;
    IBOutlet __weak NSLayoutConstraint      *verticalConstraint;
    BOOL                                    isKeyboardPresented;
    IBOutlet __weak UIView                  *inputContainerView;
}


@end

