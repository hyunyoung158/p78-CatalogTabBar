//
//  ProductCell.h
//  TableViewCustomCell
//
//  Created by Lee HyunYoung on 2014. 1. 7..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
@interface ProductCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImage;

@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UILabel *productName;

- (void)setProductInfo:(Product *)item;

@end