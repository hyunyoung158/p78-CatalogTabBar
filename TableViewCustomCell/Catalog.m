//
//  Catalog.m
//  TableViewCustomCell
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import "Catalog.h"
#import "Product.h"

@implementation Catalog {
    NSArray *_data;
}

//Singleton 메소드
static Catalog *_instance = nil;

+ (id)defaultCatalog {
    if (nil == _instance) {
        _instance = [[Catalog alloc] init];
    }
    return _instance;
}

- (id)init {
    self = [super init];
    if (self) {
        _data = @[[Product productWithName:@"Baseball" price:100 image:@"baseball.png"],
                  [Product productWithName:@"Basketball" price:200 image:@"basketball.png"],
                  [Product productWithName:@"Volleyball" price:300 image:@"volleyball.png"]];
    }
    return self;
}

//예제를 간단하게 하기 위해서, 배열의 인덱스로 제품 구분
- (id)productAt:(NSInteger)index {
    return [_data objectAtIndex:index];
}

//제품의 개수
- (NSInteger)numberOfProducts {
    return [_data count];
}
@end
