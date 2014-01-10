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
        _data = @[[Product productWithName:@"Baseball" price:100 image:@"baseball.png" productCode:@"0" productDetail:@"롯데 삼성 한화 류현진 추신수 클리브랜드 텍사스 LA다저스 런닝맨 류현진 치킨왕 치킨..먹고싶다."],
                  [Product productWithName:@"Basketball" price:200 image:@"basketball.png" productCode:@"1" productDetail:@"This is Basketball. i don't like basketball."],
                  [Product productWithName:@"Volleyball" price:300 image:@"volleyball.png" productCode:@"2" productDetail:@"배구공!배구배구 배구공으로 배구를 한적이 없네요. 피구왕 통키가 사용하면 불이 붙는 이상한 공입니다."],
                  [Product productWithName:@"Football" price:400 image:@"football.png" productCode:@"3" productDetail:@"축구축구 추추축구 축구 이청용 축구 축구구축구 싸커맨 예!/ㅇ0ㅇ/!!"]];
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

//제품 코드를이용해서 제품 정보를 얻어온다.
- (Product *)productWithCode:(NSString *)productCode {
    for (Product *one in _data) {
        if ([one isEqualProduct:productCode]) {
            return  one;
        }
    }
    return nil;
}
@end
