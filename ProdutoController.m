//
//  ProdutoController.m
//  CheapMarket
//
//  Created by Conrado Werlang on 3/9/15.
//  Copyright (c) 2015 Paulo Henrique dos Santos. All rights reserved.
//

#import "ProdutoController.h"
#import <Parse/Parse.h>

@implementation ProdutoController

- (void)addProduto:(Produto*)produto response:(void (^)(BOOL success, NSError *error))response
{
    
    
    
    PFObject *produto2 = [PFObject objectWithClassName:@"produto"];
    
    produto2[@"nome"] = produto.nome;
    produto2[@"preco"] = produto.preco;
    produto2[@"mercado"] = produto.mercado;

    
    [produto2 saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];
    
    
}


@end
