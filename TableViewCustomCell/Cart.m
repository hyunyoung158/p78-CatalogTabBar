//
//  Cart.m
//  TableViewCustomCell
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import "Cart.h"

@interface Cart()

@end
@implementation Cart

//싱클톤 방식
static Cart *instance;

+ (Cart *)sharedModel {
    if (nil == instance) {
        instance = [[Cart alloc] init];
    }
    return instance;
}

//카트에 제품 추가!
- (void)addProduct:(Product *)item {
    //이미 있는 상품일 경우 incQuantity
    CartItem *cartItem = [[CartItem alloc] init];
    cartItem.product = item;
    cartItem.qty = 1;
    
    [self.items addObject:cartItem];
}
//카트의 상품 수량을 늘린다.
- (void)incQuantity:(NSString *)productCode {
    CartItem *item = [self cartItemWith:productCode];
    item.qty++;
}
//카트의 상품 수량을 줄인다.
- (void)decQuantity:(NSString *)productCode {
    CartItem *item = [self cartItemWith:productCode];
    item.qty--;
    
    //제품 수량이 0이면 삭제
    if (0 == item.qty) {
        [self.items removeObject:item];
    }
}

//상품 코드로 카트 내 상품 찾기
- (CartItem *)cartItemWith:(NSString *)productCode {
    for (CartItem *item in self.items) {
        if ([item.product isEqualProduct:productCode]) {
            return item;
        }
    }
    return nil;
}

- (id)init {
    self = [super init];
    if (self) {
        self.items = [[NSMutableArray alloc] init];
    }
    
    return self;
}
@end
