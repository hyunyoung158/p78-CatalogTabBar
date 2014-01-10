//
//  ProductDetailViewController.m
//  TableViewCustomCell
//
//  Created by SDT-1 on 2014. 1. 10..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "Catalog.h"
#import "Product.h"

@interface ProductDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UITextView *productDetail;

@end

@implementation ProductDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    //카탈로그에서 제품 정보를 얻어온다.
    Catalog *catalog = [Catalog defaultCatalog];
    Product *product = [catalog productWithCode:self.productCode];
    
    //제품 정보를 뷰에 반영~
    self.imageView.image = [UIImage imageNamed:product.imageName];
    self.productName.text = product.name;
    self.productPrice.text = [NSString stringWithFormat:@"%d", (int)product.price];
    self.productDetail.text = product.productDetail;
    self.title = product.name;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
