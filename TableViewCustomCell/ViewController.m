//
//  ViewController.m
//  TableViewCustomCell
//
//  Created by Lee HyunYoung on 2014. 1. 7..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"
#import "Product.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>{
    NSArray *data;
}

@end

@implementation ViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
    
    Product *item = data[indexPath.row];
    [cell setProductInfo:item];
    
    return cell;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    data = @[[Product product:@"Baseball" price:@"100" image:@"girl0.jpg"],
             [Product product:@"Football" price:@"200" image:@"girl1.jpg"],
             [Product product:@"Rugbyball" price:@"300" image:@"girl2.jpg"],
             [Product product:@"Willson" price:@"400" image:@"girl3.jpg"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
