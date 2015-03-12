//
//  UsuariosController.m
//  CheapMarket
//
//  Created by Paulo Henrique dos Santos on 09/03/15.
//  Copyright (c) 2015 Paulo Henrique dos Santos. All rights reserved.
//

#import "UsuariosController.h"
#import <Parse/Parse.h>


@implementation UsuariosController

+ (UsuariosController *) singleton
{
    static UsuariosController *instance;
    
    if (instance == nil)
        instance = [[UsuariosController alloc] init];
    
    return instance;
}

- (void)signUp:(Usuario*)UserSignUp response:(void (^)(BOOL success, NSError *error))response
{
    PFUser *user = [PFUser user];
    user.objectId= UserSignUp.idUser;
    user.username= UserSignUp.username;
    user.password= UserSignUp.password;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        response(succeeded, error);
        
    }];
    
}


- (void)loginUser:(Usuario *)usuario response:(void (^)(bool success))response{
    
    [PFUser logInWithUsernameInBackground:usuario.username
                                 password:usuario.password
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            
                                            
                                            
                                            response(YES);
                                            
                                        } else {
                                            NSLog(@"Error message: %@", error.description);
                                            
                                            response(NO);
                                        }
                                    }];
    
}



@end
