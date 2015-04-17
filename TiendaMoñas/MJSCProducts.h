//
//  MJSCProducts.h
//  TiendaMoñas
//
//  Created by María Jesús Senosiain Caamiña on 28/03/15.
//  Copyright (c) 2015 María Jesús Senosiain Caamiña. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJSCProduct.h"

@interface MJSCProducts : NSObject

@property(nonatomic, readonly) NSDictionary* products;
@property(nonatomic, readonly) NSArray* sections;
@property(nonatomic, readonly) NSUInteger sectionCount;

-(id) initWithProducts;


-(MJSCProduct*) productAtSection:(NSUInteger) section
                            index:(NSUInteger) index;


-(NSString*) sectionAtSectionId:(NSUInteger) section;

-(NSUInteger) countProductsAtSection:(NSUInteger) section;



@end


