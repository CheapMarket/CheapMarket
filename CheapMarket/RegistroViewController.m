//
//  RegistroViewController.m
//  CheapMarket
//
//  Created by Paulo Henrique dos Santos on 09/03/15.
//  Copyright (c) 2015 Paulo Henrique dos Santos. All rights reserved.
//

#import "RegistroViewController.h"
#import "UsuariosController.h"

@interface RegistroViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtUsuario;
@property (weak, nonatomic) IBOutlet UITextField *txtSenha;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintBottom;
@end

@implementation RegistroViewController {
    CGFloat _initialConstant;
}

// A small offset so the button won't be immediately above the keyboard.
static CGFloat keyboardHeightOffset = 15.0f;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)finishButtonPressed:(UIButton *)sender {
    
    [self signupUser];
    
}

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Methods Signup user

- (void)signupUser {
    Usuario *user = [[Usuario alloc] init];
    user.username = self.txtUsuario.text;
    user.password = self.txtSenha.text;
    
    //UsuariosController *userControl = [[UsuariosController alloc] init];
    [[UsuariosController singleton] signUp:user response:^(BOOL success, NSError *error) {
        
        if (success) {
            [self performSelectorOnMainThread:@selector(successfulRegistration) withObject:nil waitUntilDone:NO];
        } else {
            [self performSelectorOnMainThread:@selector(errorRequestLogin) withObject:nil waitUntilDone:NO];
        }
        
    }];
}

- (void)successfulRegistration {
    [self performSegueWithIdentifier:@"gotoTabBar2" sender:nil];
}

- (void)errorRequestLogin {
    
    [self alertWithTitle:@"Fail" message:@"Something is wrong, try later!"];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)alertWithTitle:(NSString *)_alertTitle message:(NSString *)_alertMessage {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:_alertTitle message:_alertMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}


@end
