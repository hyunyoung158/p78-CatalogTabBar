//
//  ProductCell.h
//  TableViewCustomCell
//
//  Created by Lee HyunYoung on 2014. 1. 7..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "CartDelegate.h"

@interface ProductCell : UITableViewCell

- (void)setProductInfo:(Product *)item;
@property (weak) id<CartDelegate> delegate;
@end
