//
//  ComprasViewController.m
//  CheapMarket
//
//  Created by Paulo Henrique dos Santos on 09/03/15.
//  Copyright (c) 2015 Paulo Henrique dos Santos. All rights reserved.
//

#import "ComprasViewController.h"
#import "ComprasTableViewCell.h"
#import <Parse/Parse.h>
#import "Common.h"
#import "Util.h"
#import "Usuario.h"
#import "ListaController.h"

@interface ComprasViewController ()
{
    NSArray *arrayLista;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *dataSourceLista;

@end

@implementation ComprasViewController



- (void)loadData:(UIRefreshControl *)refreshControl {
    
    ListaController *listaControl = [[ListaController alloc] init];
    
    arrayLista = [[NSArray alloc] init];
        //self.user = [Util unarchiveObjectFromUserDefaultsWithKey:UD_USER_LOGGED];
    
    
        [listaControl requestLista:^(NSArray *dataSourceLista, NSError *error){
            
            arrayLista = dataSourceLista;
            
            [self performSelectorOnMainThread:@selector(updateDataWithLista:) withObject:refreshControl waitUntilDone:NO];
            
        } fromUser:self.user];
    
    
        
        
    
        
    
}


- (void)updateDataWithLista:(UIRefreshControl *)refreshControl {
    if (refreshControl)
        [refreshControl endRefreshing];
    
    [self.tableView reloadData];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.dataSourceLista = [[NSMutableArray alloc] init];
//    
//    for (int i = 0; i < 10; i++) {
//        [self.dataSourceLista addObject:[NSString stringWithFormat:@"Name: %d",i]];
//    }
    NSLog(@"Usuario logado : %@", UD_USER_LOGGED);
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(loadData:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    [self loadData:nil];

    
}


- (PFQuery *)queryForTable {
    PFQuery *query = [PFQuery queryWithClassName:@"lista"];
    
    // If no objects are loaded in memory, we look to the cache first to fill the table
    // and then subsequently do a query against the network.
    
    [query orderByDescending:@"createdAt"];
    
    return query;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayLista count];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellName"];
//        UILabel *label = (UILabel *)[cell viewWithTag:10];
//        label.text = self.dataSourceLista[indexPath.row];
//        return cell;
    ComprasTableViewCell * compraCell = [tableView dequeueReusableCellWithIdentifier:@"CellName" forIndexPath:indexPath];
    
    Lista *lista = [arrayLista objectAtIndex:indexPath.row];
    
    compraCell.lblNome.text = lista.nome;
    NSLog(@"Celula : %@", lista.nome);
    
    return compraCell;
    
  
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
