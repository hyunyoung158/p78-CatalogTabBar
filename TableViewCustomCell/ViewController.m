//
//  ViewController.m
//  TableViewCustomCell
//
//  Created by Lee HyunYoung on 2014. 1. 7..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "ProductCell.h"
#import "Catalog.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, CartDelegate> {
	NSMutableArray *cartItems;
}

@property (weak, nonatomic) IBOutlet UITableView *table;
@end

@implementation ViewController

//카탈로그 델리게이트 : 제품을 카트에 추가한다.
- (void)addItem:(id)sender {
    //제품 식별자를 위한 인덱스
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *product = [[Catalog defaultCatalog] productAt:(int)indexPath.row];
    
    [cartItems addObject:product];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];     // 이게뭐징
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

//섹션 0 : 카탈로그, 섹션1 : 카트
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return [[Catalog defaultCatalog] numberOfProducts];
    }else {
        return [cartItems count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1번째 섹션은 카탈로그
    if (0 == indexPath.section) {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
        //ViewController(self)가 셀의 델리게이트 역할 수행
        cell.delegate = self;
        Product *product = [[Catalog defaultCatalog] productAt:(int)indexPath.row];
        [cell setProductInfo:product]; // Model을 UI에 반영
        return cell;
    }else {
        //2번째 섹션은 카트
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
        Product *product = cartItems[indexPath.row];
        cell.textLabel.text = product.name;
        return cell;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return @"Product";
    }else {
        return @"Items in Cart";
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	cartItems = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
