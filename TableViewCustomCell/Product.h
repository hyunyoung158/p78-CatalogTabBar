//
//  Product.h
//  TableViewCustomCell
//
//  Created by Lee HyunYoung on 2014. 1. 7..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong,nonatomic) NSString *name;
@property (nonatomic) NSInteger price;
@property (strong,nonatomic) NSString *imageName;

+ (id)productWithName:(NSString *)name price:(NSInteger)price image:(NSString *)image;

@end