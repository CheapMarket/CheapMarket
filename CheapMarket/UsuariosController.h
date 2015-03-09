//
//  UsuariosController.h
//  CheapMarket
//
//  Created by Paulo Henrique dos Santos on 09/03/15.
//  Copyright (c) 2015 Paulo Henrique dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Usuario.h"


@interface UsuariosController : NSObject

+ (UsuariosController *) singleton;

- (void)signUp:(Usuario*)UserSignUp response:(void (^)(BOOL success, NSError *error))response;
- (void)loginUser:(Usuario *)newUser response:(void (^)(bool success))response;

@end
