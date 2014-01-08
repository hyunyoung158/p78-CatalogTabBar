//
//  ProductCell.m
//  TableViewCustomCell
//
//  Created by Lee HyunYoung on 2014. 1. 7..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import "ProductCell.h"

@implementation ProductCell

- (void)setProductInfo:(Product *)item {
    _productName.text = item.name;
    _productPrice.text = item.price;
    _productImage.image = [UIImage imageNamed:item.imageName];
}


@end
