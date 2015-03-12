//
//  MercadoController.m
//  CheapMarket
//
//  Created by Conrado Werlang on 3/9/15.
//  Copyright (c) 2015 Paulo Henrique dos Santos. All rights reserved.
//

#import "MercadoController.h"
#import <Parse/Parse.h>

@implementation MercadoController

- (void)addMercado:(Mercado*)mercado response:(void (^)(BOOL success, NSError *error))response
{
    
    
    
    PFObject *mercado2 = [PFObject objectWithClassName:@"mercado"];
    
    mercado2[@"nome"] = mercado.nome;
    mercado2[@"nome"] = mercado.endereco;
    mercado2[@"nome"] = mercado.listaProdutos;
    
    [mercado2 saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];


}

@end
