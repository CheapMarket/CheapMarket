//
//  Produto.h
//  CheapMarket
//
//  Created by Marco Aurelio Dias Americo on 3/9/15.
//  Copyright (c) 2015 Marco Aurelio Dias Americo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Produto : NSObject

@property NSString *nome;
@property NSNumber *preco;

-(void)adiciona;
-(void)remove;
-(BOOL)verificaCompra;

@end
