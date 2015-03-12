//
//  Usuario.m
//  CheapMarket
//
//  Created by Marco Aurelio Dias Americo on 3/9/15.
//  Copyright (c) 2015 Marco Aurelio Dias Americo. All rights reserved.
//

#import "Usuario.h"

@implementation Usuario

#pragma mark - Metodos da Classe

- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.idUser forKey:@"idUser"];
    [encoder encodeObject:self.username forKey:@"username"];
    [encoder encodeObject:self.password forKey:@"password"];
 
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        self.idUser = [decoder decodeObjectForKey:@"idUser"];
        self.username = [decoder decodeObjectForKey:@"username"];
        self.password = [decoder decodeObjectForKey:@"password"];
      
    }
    return self;
}



@end
