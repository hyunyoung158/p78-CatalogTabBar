//
//  CartCell.m
//  TableViewCustomCell
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import "CartCell.h"


@interface CartCell()

@property (weak, nonatomic) IBOutlet UILabel *cartItemName;
@property (weak, nonatomic) IBOutlet UILabel *cartItemQty;

@property (copy, nonatomic) NSString *productCode;
@end

@implementation CartCell

- (IBAction)plusClicked:(id)sender {
    [self.delegate incQuantity:self.productCode];
}

- (IBAction)minusClicked:(id)sender {
    [self.delegate decQuantity:self.productCode];
}

//셀에 반영할 내용
- (void)setCartItem:(CartItem *)item {
    //제품 구별용 코드 - 카탈로그 셀 선택시 상품코드 받아옴.
    self.productCode = item.product.productCode;
    
    // 셀 반영
    NSLog(@"%@", item.product.name);
    self.cartItemName.text = item.product.name;
    self.cartItemQty.text = [NSString stringWithFormat:@"%d개", (int)item.qty];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
