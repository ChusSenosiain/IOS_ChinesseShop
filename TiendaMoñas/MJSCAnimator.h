//
//  MJSCAnimator.h
//  TiendaMoñas
//
//  Created by María Jesús Senosiain Caamiña on 10/04/15.
//  Copyright (c) 2015 María Jesús Senosiain Caamiña. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    AnimatorPresent,
    AnimatorDismiss,
    AnimatorPush,
    AnimatorPop
} AnimationType;

@interface MJSCAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property(nonatomic) AnimationType animationType;

@end
