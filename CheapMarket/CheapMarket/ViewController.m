//
//  ViewController.m
//  CheapMarket
//
//  Created by Paulo Henrique dos Santos on 06/03/15.
//  Copyright (c) 2015 Paulo Henrique dos Santos. All rights reserved.
//

#import "ViewController.h"
#import "UsuariosController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtPass;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnLogin:(id)sender {
    
    Usuario* teste = [[Usuario alloc] init];
    teste.username = _txtLogin.text;
    teste.password = _txtPass.text;
    
    [[UsuariosController singleton] signUp:teste response:^(BOOL success, NSError *error) {
        if (success) {
            
            
        } else {
            
            
        }

    }];
  
     
     
  
    
}


@end
