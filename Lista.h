//
//  Lista.h
//  CheapMarket
//
//  Created by Marco Aurelio Dias Americo on 3/9/15.
//  Copyright (c) 2015 Marco Aurelio Dias Americo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Usuario.h"

@interface Lista : NSObject

@property (nonatomic) NSString *nome;
@property (nonatomic) NSNumber* preco;
@property (nonatomic) NSMutableArray *produto;
@property (nonatomic) NSMutableArray *quantidade;
@property (nonatomic) Usuario *usuario;

@end
