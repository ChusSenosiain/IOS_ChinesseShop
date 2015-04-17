//
//  MJSCProductDetailsVC.h
//  TiendaMoñas
//
//  Created by María Jesús Senosiain Caamiña on 28/03/15.
//  Copyright (c) 2015 María Jesús Senosiain Caamiña. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJSCProduct;

@interface MJSCProductDetailsVC : UIViewController

@property (strong, nonatomic) UIScreenEdgePanGestureRecognizer *recognizer;

-(id) initWithProduct:(MJSCProduct*) product;


@end
