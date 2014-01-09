//
//  Product.m
//  TableViewCustomCell
//
//  Created by Lee HyunYoung on 2014. 1. 7..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import "Product.h"

@implementation Product

+ (id)productWithName:(NSString *)name price:(NSInteger)price image:(NSString *)image {
	Product *item = [[Product alloc] init];
	item.name = name;
	item.price = price;
	item.imageName = image;
	
	return item;
}

@end