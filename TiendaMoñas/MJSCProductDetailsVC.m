//
//  MJSCProductDetailsVC.m
//  TiendaMoñas
//
//  Created by María Jesús Senosiain Caamiña on 28/03/15.
//  Copyright (c) 2015 María Jesús Senosiain Caamiña. All rights reserved.
//

#import "MJSCProductDetailsVC.h"
#import "MJSCProduct.h"
#import <Foundation/Foundation.h>

@interface MJSCProductDetailsVC () <UINavigationControllerDelegate>

@property(nonatomic, strong) MJSCProduct *product;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productDescription;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;

@property (weak, nonatomic) IBOutlet UILabel *productCategory;



- (IBAction)btnButPush:(id)sender;
- (IBAction)volver:(id)sender;


@end

@implementation MJSCProductDetailsVC

-(id) initWithProduct:(MJSCProduct*) product {
    
    if (self = [super init]) {
        _product = product;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.productImage.image = self.product.productImage;
    self.productName.text = self.product.productName;
    self.productDescription.text = self.product.productDescription;
    self.productPrice.text = [self.product.productPrice stringValue];
    
    [self.view addGestureRecognizer:self.recognizer];
    
    
    
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(alarma:) userInfo:nil repeats:YES];
//    
//    [timer invalidate];
    
    
}



// Nos ponemos como delegado del navigation coroller

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //self.navigationController.delegate = self;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnButPush:(id)sender {
    
    self.productImage.alpha = 1.0f;
    self.productImage.transform = CGAffineTransformIdentity;
    self.productImage.layer.transform = CATransform3DIdentity;
    
    __weak typeof (self) weakself = self;
    [UIView animateWithDuration:3.0f animations:^{
        weakself.productImage.alpha = 0.2f;
        //weakself.productImage.transform = CGAffineTransformRotate(weakself.productImage.transform, M_PI_4);
        
        //weakself.productImage.layer.transform = CATransform3DMakeRotation(M_PI_4, 1.0f, 1.0f, 0.0f);
        
        CATransform3D transformer = CATransform3DMakeRotation(M_PI_4, 1.0f, 1.0f, 0.0f);
        
        weakself.productImage.layer.transform = CATransform3DTranslate(transformer, 50.0, 0, 300.0);
    }];
}

- (IBAction)volver:(id)sender {
    
    // 1. Forma 1: por el navigationViewController
//    // Si tenemos navigationViewController hacemos un pop, si no, hacemos un dismiss
//    if (self.navigationController != nil) {
//        [self.navigationController popViewControllerAnimated:YES];
//    // Si estamos con el present
//    } else {
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }
    
    
    // 2. Forma 2: por el presentViewController
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
}

@end
