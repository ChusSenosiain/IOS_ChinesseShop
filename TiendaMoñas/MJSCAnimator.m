//
//  MJSCAnimator.m
//  TiendaMoñas
//
//  Created by María Jesús Senosiain Caamiña on 10/04/15.
//  Copyright (c) 2015 María Jesús Senosiain Caamiña. All rights reserved.
//

#import "MJSCAnimator.h"
#import <Foundation/Foundation.h>



@implementation MJSCAnimator


- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 3.0;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    // Escenario donde hago la animación
    UIView *contextView = [transitionContext containerView];
    
     // Controlador origen
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    // Controlador destino
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // Creo la situación inicial
    
    
    // Animación de juanjo
    
//    [contextView insertSubview:toVC.view belowSubview:fromVC.view];
    
//    toVC.view.alpha = 0.0;
//    fromVC.view.alpha = 1.0;
//    toVC.view.frame = fromVC.view.frame;
//    
//    [UIView animateWithDuration:1.5 animations:^{
//        fromVC.view.alpha = 0.0;
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:1.5 animations:^{
//            toVC.view.alpha = 1.0;
//        } completion:^(BOOL finished) {
//            [transitionContext completeTransition:YES];
//        }];
//    }];
    
    // Creo la situación inicial
    if (self.animationType != AnimatorDismiss) {
        [contextView insertSubview:toVC.view belowSubview:fromVC.view];
    }
    
    
    
    toVC.view.frame = fromVC.view.bounds;
    
    if (self.animationType != AnimatorDismiss && self.animationType != AnimatorPop) {
        toVC.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
    } else {
        toVC.view.transform = CGAffineTransformMakeScale(3.0, 3.0);
    }
    
    toVC.view.alpha = 0;
    [UIView animateWithDuration:3.0 animations:^{
        
        
        if (self.animationType != AnimatorDismiss && self.animationType != AnimatorPop) {
            fromVC.view.transform = CGAffineTransformMakeScale(3.0, 3.0);
        } else {
            fromVC.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
        }

        toVC.view.transform = CGAffineTransformIdentity;
        fromVC.view.alpha = 0;
        toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition: ![transitionContext transitionWasCancelled]];
         
         // Poner el estado final
         toVC.view.transform = fromVC.view.transform = CGAffineTransformIdentity;
         toVC.view.alpha = fromVC.view.alpha = 1.0;
         
    }];
}


@end
