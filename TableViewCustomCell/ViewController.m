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
#import "Cart.h"
#import "CartCell.h"
#import "ProductDetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, ProductCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) Cart *cart;
@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //제품 상세보기 뷰 컨트롤러
    ProductDetailViewController *detailVC = segue.destinationViewController;
    
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *selectedProduct = [[Catalog defaultCatalog] productAt:indexPath.row];

    //제품의 코드를 넘겨준다.
    detailVC.productCode = selectedProduct.productCode;
}

//카탈로그 델리게이트 : 제품을 카트에 추가한다.
- (void)addItem:(id)sender {
    //제품 식별자를 위한 인덱스
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *product = [[Catalog defaultCatalog] productAt:(int)indexPath.row];
    
    //핵심 코드
    if (![self.cart cartItemWith:product.productCode]) {
        //없는 경우 카트에 추가
        [self.cart addProduct:product];
    }else {
        //이미 있는 상품일 경우 incQuantity
        [self.cart incQuantity:product.productCode];
    }
//    [self reloadCartSection];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return [[Catalog defaultCatalog] numberOfProducts];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1번째 섹션은 카탈로그
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
    //ViewController(self)가 셀의 델리게이트 역할 수행
    cell.delegate = self;
    Product *product = [[Catalog defaultCatalog] productAt:(int)indexPath.row];
    [cell setProductInfo:product]; // Model을 UI에 반영
    return cell;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cart = [Cart sharedModel];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
