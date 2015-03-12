//
//  ListaController.m
//  CheapMarket
//
//  Created by Conrado Werlang on 3/9/15.
//  Copyright (c) 2015 Paulo Henrique dos Santos. All rights reserved.
//

#import "ListaController.h"
#import <Parse/Parse.h>

@implementation ListaController

- (void)addLista:(Lista*)lista response:(void (^)(BOOL success, NSError *error))response
{
   
    
    
    PFObject *lista2 = [PFObject objectWithClassName:@"lista"];
    lista2[@"nome"] = lista.nome;
    lista2[@"preco"] =  lista.preco;
    lista2[@"produto"] = lista.produto;
    lista2[@"quantidade"] = lista.quantidade;
    lista2[@"quantidade"] = lista.quantidade;
    
    [lista2 saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    

    
    }];
}


- (void)requestLista:(void (^)(NSArray *listas, NSError *error))response fromUser:(Usuario *)fromUser {
    

  
    PFQuery *query = [PFQuery queryWithClassName:@"lista"];
    
    
    [query whereKey:@"user" equalTo:[PFUser currentUser]];
    
    
    
    [query orderByDescending:@"createdAt"];
    
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *resultsLista, NSError *error) {
        
        if (!resultsLista) {
            response(nil, error);
        }
        else {
            NSMutableArray *listas = [[NSMutableArray alloc] init];
            
            for (PFObject *resultLista in resultsLista)
            {

                
                Lista *lista = [[Lista alloc] init];
                lista.nome = [resultLista objectForKey:@"nome"];
                NSLog(@"Lista : %@", lista.nome);
                
                [listas addObject:lista];
            }
            NSLog(@"Count listas : %ld", listas.count);
            response(listas, nil);
        }
    }];
    
}


@end