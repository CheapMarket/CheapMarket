//
//  ComprasViewController.h
//  CheapMarket
//
//  Created by Paulo Henrique dos Santos on 09/03/15.
//  Copyright (c) 2015 Paulo Henrique dos Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"



@interface ComprasViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong) Usuario *user;

@end
