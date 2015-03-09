//
//  Usuario.h
//  CheapMarket
//
//  Created by Marco Aurelio Dias Americo on 3/9/15.
//  Copyright (c) 2015 Marco Aurelio Dias Americo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Usuario : NSObject

@property (nonatomic) NSString *login;
@property (nonatomic) NSInteger *senha;

- (BOOL) validaSenha : (NSString*)loginUsuario : (NSInteger*)senhaUsuario;

@end
