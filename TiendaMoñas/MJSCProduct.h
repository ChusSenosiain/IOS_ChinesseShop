//
//  MJSCProduct.h
//  TiendaMoñas
//
//  Created by María Jesús Senosiain Caamiña on 28/03/15.
//  Copyright (c) 2015 María Jesús Senosiain Caamiña. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MJSCProduct : NSObject

@property(nonatomic, copy) NSString *productName;
@property(nonatomic, copy) NSString *productDescription;
@property(nonatomic, strong) UIImage *productImage;
@property(nonatomic, strong) NSNumber *productPrice;
@property(nonatomic, copy) NSString *productCategory;


-(id) initWithProductName:(NSString *) productName
       productDescription:(NSString *) productDescription
             productImage:(UIImage *) productImage
             productPrice:(NSNumber *) productPrice
            productCategory:(NSString *) productCategory;

@end
