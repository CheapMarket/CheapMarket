//
//  ViewController.m
//  CheapMarket
//
//  Created by Paulo Henrique dos Santos on 06/03/15.
//  Copyright (c) 2015 Paulo Henrique dos Santos. All rights reserved.
//

#import "ViewController.h"
#import "UsuariosController.h"
#import "Util.h"
#import "Common.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtPass;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintBottom;

@end

@implementation ViewController{
    CGFloat _initialConstant;
}
static CGFloat keyboardHeightOffset = 15.0f;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (IBAction)dismissKeyboard {
    
    // This method will resign all responders, dropping the keyboard.
    [self.view endEditing:YES];
    
}

- (void)keyboardWillShow:(NSNotification*)notification {
    
    // Getting the keyboard frame and animation duration.
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    NSTimeInterval keyboardAnimationDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    if (!_initialConstant) {
        _initialConstant = _constraintBottom.constant;
    }
    
    // If screen can fit everything, leave the constant untouched.
    _constraintBottom.constant = MAX(keyboardFrame.size.height + keyboardHeightOffset, _initialConstant);
    [UIView animateWithDuration:keyboardAnimationDuration animations:^{
        // This method will automatically animate all views to satisfy new constants.
        [self.view layoutIfNeeded];
    }];
    
}

- (void)keyboardWillHide:(NSNotification*)notification {
    
    // Getting the keyboard frame and animation duration.
    NSTimeInterval keyboardAnimationDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // Putting everything back to place.
    _constraintBottom.constant = _initialConstant;
    [UIView animateWithDuration:keyboardAnimationDuration animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnLogin:(id)sender {
    
    Usuario* user = [[Usuario alloc] init];
    user.username = _txtLogin.text;
    user.password = _txtPass.text;
    
//    [[UsuariosController singleton] signUp:teste response:^(BOOL success, NSError *error) {
//        if (success) {
//            
//            
//        } else {
//            
//            
//        }
//
//    }];
    
    [[UsuariosController singleton] loginUser:user response:^(bool success) {
        
        if (success) {
            // Save User Object in NSUserDefaults
            [Util archiveAndSaveObject:user toUserDefaultsWithKey:UD_USER_LOGGED];
            NSLog(@"Salvando objeto: %@", UD_USER_LOGGED);
            
            [self performSelectorOnMainThread:@selector(successfulLogin) withObject:nil waitUntilDone:NO];
            
        } else {
            
            [self performSelectorOnMainThread:@selector(errorRequestLogin) withObject:nil waitUntilDone:NO];
            
        }
    }];

    
  
}


- (void)successfulLogin {
    [self performSegueWithIdentifier:@"gotoTabBar" sender:nil];
}


- (void)errorRequestLogin {
    
    [self alertWithTitle:@"Fail" message:@"Login or Password invalid!"];
    
}

- (void)alertWithTitle:(NSString *)_alertTitle message:(NSString *)_alertMessage {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:_alertTitle
                                                    message:_alertMessage
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}



@end
