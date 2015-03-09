//
//  Amigos.h
//  CheapMarket
//
//  Created by Marco Aurelio Dias Americo on 3/9/15.
//  Copyright (c) 2015 Marco Aurelio Dias Americo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Usuario.h"

@interface Amigos : NSObject

@property (nonatomic) Usuario *seguindo;
@property (nonatomic) Usuario *seguidores;

-(void) adciona;



@end
