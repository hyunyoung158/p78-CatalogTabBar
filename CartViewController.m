//
//  CartViewController.m
//  Cart
//
//  Created by SDT-1 on 2014. 1. 13..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import "Cart.h"
#import "CartCell.h"
#import "CartDelegate.h"
#import "CartViewController.h"

@interface CartViewController ()<CartDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) Cart *cart;

@end

@implementation CartViewController

//카트 내 상품 수량 증가
- (void)incQuantity:(NSString *)productCode {
    [self.cart incQuantity:productCode];
    [self.table reloadData];
}
//카트 내 상품 수량 감소
- (void)decQuantity:(NSString *)productCode {
    [self.cart decQuantity:productCode];
    [self.table reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
    cell.delegate = self; //CartViewController가
    
    //셀 컨텐츠
    CartItem *cartItem = [self.cart.items objectAtIndex:indexPath.row];
    [cell setCartItem:cartItem];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cart.items count];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"wilAppear");
    [self.table reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cart = [Cart sharedModel];
   
    [self.table reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
