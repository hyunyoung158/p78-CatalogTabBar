//
//  Catalog.h
//  TableViewCustomCell
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Catalog : NSObject

- (id)productAt:(NSInteger)index;
- (NSInteger)numberOfProducts;

//싱글턴 방식으로 카탈로그 사용
+ (id)defaultCatalog;
@end
