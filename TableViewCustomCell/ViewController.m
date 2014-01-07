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

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController {
    NSArray *data;
}

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

    data = @[[Product product:@"Baseball" price:@"100" image:@"baseball.png"],
             [Product product:@"Football" price:@"200" image:@"football.png"],
             [Product product:@"Rugbyball" price:@"300" image:@"rugbyball.png"],
             [Product product:@"Willson" price:@"400" image:@"volleyball.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
