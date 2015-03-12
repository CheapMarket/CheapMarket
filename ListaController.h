//
//  ListaController.h
//  CheapMarket
//
//  Created by Conrado Werlang on 3/9/15.
//  Copyright (c) 2015 Paulo Henrique dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Lista.h"

@interface ListaController : NSObject

- (void)requestLista:(void (^)(NSArray *listas, NSError *error))response fromUser:(Usuario *)fromUser;

@end
