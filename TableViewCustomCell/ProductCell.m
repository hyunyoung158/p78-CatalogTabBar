//
//  ProductCell.m
//  TableViewCustomCell
//
//  Created by Lee HyunYoung on 2014. 1. 7..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import "ProductCell.h"
@interface ProductCell()

@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@end

@implementation ProductCell

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

- (void)setProductInfo:(Product *)item {
	self.productName.text = item.name;
	self.productPrice.text = [NSString stringWithFormat:@"%d", (int)item.price];
	self.productImage.image = [UIImage imageNamed:item.imageName];
}

- (IBAction)addCart:(id)sender {
    [self.delegate addItem:self];

}

@end
