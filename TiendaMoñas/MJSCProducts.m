//
//  MJSCProducts.m
//  TiendaMoñas
//
//  Created by María Jesús Senosiain Caamiña on 28/03/15.
//  Copyright (c) 2015 María Jesús Senosiain Caamiña. All rights reserved.
//

#import "MJSCProducts.h"
#import "MJSCProduct.h"

@implementation MJSCProducts


-(id) initWithProducts {
    
    if (self = [super init]) {
        _products = [self createProducts];
    }
    
    return self;
}


-(NSUInteger) sectionCount {
    return [self.products count];
}



-(MJSCProduct*) productAtSection:(NSUInteger) section
                            index:(NSUInteger) index {
    
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES];
    
    NSArray *array = [[self.products allKeys] sortedArrayUsingDescriptors:@[descriptor]];
    
    // Objtener el string por el integer de la sección
    NSString *stringSection = [array objectAtIndex:section];
    
    
    return [[self.products objectForKey:stringSection] objectAtIndex:index];
    
}

-(NSString*) sectionAtSectionId:(NSUInteger) section {
    
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES];
    
    NSArray *array = [[self.products allKeys] sortedArrayUsingDescriptors:@[descriptor]];
    
    // Objtener el string por el integer de la sección
    return [array objectAtIndex:section];
    
    
}

-(NSUInteger) countProductsAtSection:(NSUInteger) section {
    
    
    // Obtener el array de claves para ver que seccion
    //NSArray *array = [self.products keysSortedByValueUsingComparator:^NSComparisonResult(NSString* obj1, NSString* obj2) {
    //    return [obj1 compare:obj2];
    //}];
    
    
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES];
    
    NSArray *array = [[self.products allKeys] sortedArrayUsingDescriptors:@[descriptor]];
    
    
    // Objtener el string por el integer de la sección
    NSString *stringSection = [array objectAtIndex:section];
    
    return [[self.products objectForKey:stringSection] count];
}




-(NSDictionary*) createProducts {
    
    NSMutableDictionary *productsTemp = [[NSMutableDictionary alloc] init];
    
    MJSCProduct *balones = [[MJSCProduct alloc] initWithProductName:@"Balones oficales LFP"
                                                 productDescription:@"Hight quality balls!"
                                                       productImage:[UIImage imageNamed:@"balones_oficiales.jpg"]
                                                       productPrice:@2.25
                                                    productCategory:@"Deportes"];
    
    [productsTemp setObject:@[balones] forKey:@"Deportes"];
    
    
    
    MJSCProduct *consolaPoly = [[MJSCProduct alloc] initWithProductName:@"PolyStation"
                                                 productDescription:@"La auténtica PolyStation!"
                                                       productImage:[UIImage imageNamed:@"consola_poly.jpg"]
                                                       productPrice:@15.25
                                                    productCategory:@"Consolas"];
    
    
    MJSCProduct *consolaGameJoy = [[MJSCProduct alloc] initWithProductName:@"Game Joy"
                                                     productDescription:@"Pues eso...la gameboy de toda la vida con aparienci de Nintendo DS"
                                                           productImage:[UIImage imageNamed:@"consola_gamejoy.jpg"]
                                                           productPrice:@15.25
                                                        productCategory:@"Consolas"];
    
    
    
    
    [productsTemp setObject:@[consolaPoly, consolaGameJoy] forKey:@"Consolas"];
    
    
    
    
    
    return productsTemp;
    
    
}


@end
