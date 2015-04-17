//
//  MJSCProduct.m
//  TiendaMoñas
//
//  Created by María Jesús Senosiain Caamiña on 28/03/15.
//  Copyright (c) 2015 María Jesús Senosiain Caamiña. All rights reserved.
//

#import "MJSCProduct.h"

@implementation MJSCProduct

-(id) initWithProductName:(NSString *) productName
       productDescription:(NSString *) productDescription
             productImage:(UIImage *) productImage
             productPrice:(NSNumber *) productPrice
          productCategory:(NSString *) productCategory {
    
    if (self = [super init]) {
        
        _productName = productName;
        _productDescription = productDescription;
        _productImage = productImage;
        _productPrice = productPrice;
        _productCategory = productCategory;
        
    }
    
    
    return self;
}


@end
