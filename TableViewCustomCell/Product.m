//
//  Product.m
//  TableViewCustomCell
//
//  Created by Lee HyunYoung on 2014. 1. 7..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import "Product.h"

@implementation Product

+ (id)productWithName:(NSString *)name price:(NSInteger)price image:(NSString *)image productCode:(NSString *)productCode{
	Product *item = [[Product alloc] init];
	item.name = name;
	item.price = price;
	item.imageName = image;
	item.productCode = productCode;
    
	return item;
}

- (BOOL)isEqualProduct:(NSString *)productCode {
    return [self.productCode isEqualToString:productCode];
}
@end