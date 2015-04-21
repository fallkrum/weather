//
//  ViewController.m
//  weather
//
//  Created by Ilya Bukonkin on 4/13/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "LocationViewController.h"
#import "ForecastsViewController.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  \
([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface LocationViewController ()

@end

@implementation LocationViewController

- (CGFloat)keyboardHeightFromKeyboardRect:(CGRect)frame {
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))
        return frame.size.height;

    UIInterfaceOrientation orientation =
    [UIApplication sharedApplication].statusBarOrientation;
    
    if(UIInterfaceOrientationIsLandscape(orientation))
        return frame.size.width;
    
    return frame.size.height;
}

- (BOOL)canPresentForecastsViewController {
    NSString *longitudeString = longitudeTextField.text;
    NSString *latitudeString = latitudeTextFiled.text;
    
    if((!latitudeString || [latitudeString isEqualToString:@""]) ||
       (!longitudeString || [longitudeString isEqualToString:@""])) return NO;
    
    return YES;
}

- (void)presentForecastsViewController {

    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ForecastsViewController *controller =
    [storyBoard instantiateViewControllerWithIdentifier:@"ForecastsViewController"];
    
    controller.latitude =
    [NSNumber numberWithFloat:[latitudeTextFiled.text floatValue]];
    controller.longitude =
    [NSNumber numberWithFloat:[longitudeTextField.text floatValue]];
    
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    latitudeTextFiled.delegate = self;
    longitudeTextField.delegate = self;
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}


- (IBAction)goButtonPressed:(id)sender {
    BOOL canPresent = [self canPresentForecastsViewController];
    
    [self.view endEditing: canPresent];
    if(canPresent) [self presentForecastsViewController];
}


#pragma mark - TextField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)_textField {
    BOOL canPresent = [self canPresentForecastsViewController];
    
    if(canPresent) {
        [_textField resignFirstResponder];
        [self presentForecastsViewController];
    }
    
    return canPresent;
}


#pragma mark - Keyboard notifications
- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    
    if(isKeyboardPresented) return;
    isKeyboardPresented = YES;
    
    NSTimeInterval duration =
    ((NSNumber *)userInfo[UIKeyboardAnimationDurationUserInfoKey]).doubleValue;
 
    CGRect endFrame = ((NSValue *)userInfo[UIKeyboardFrameEndUserInfoKey]).CGRectValue;
    
    CGFloat keyboardHeight = [self keyboardHeightFromKeyboardRect:endFrame];

    CGFloat deltaHeight =
    keyboardHeight / 2 -
    self.navigationController.navigationBar.frame.size.height / 2;
    
    
    [UIView animateWithDuration:duration animations:^{
        verticalConstraint.constant = - deltaHeight;
        [self.view layoutIfNeeded];
    }];

}


- (void)keyboardWillHide:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    
    if(!isKeyboardPresented) return;
    isKeyboardPresented = NO;
    
    NSTimeInterval duration =
    ((NSNumber *)userInfo[UIKeyboardAnimationDurationUserInfoKey]).doubleValue;
 
    
    [UIView animateWithDuration:duration animations:^{
        verticalConstraint.constant = 0;
        [self.view layoutIfNeeded];
    }];

}


@end
