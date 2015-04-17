//
//  MJSCShopVC.m
//  TiendaMoñas
//
//  Created by María Jesús Senosiain Caamiña on 28/03/15.
//  Copyright (c) 2015 María Jesús Senosiain Caamiña. All rights reserved.
//

#import "MJSCShopVC.h"
#import "MJSCProducts.h"
#import "MJSCProduct.h"
#import "MJSCCell.h"
#import "MJSCSectionHeader.h"
#import "MJSCProductDetailsVC.h"
#import "MJSCAnimator.h"


#define kCellIdentifier @"kCellIdentifier"

@interface MJSCShopVC ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@property(nonatomic, strong) MJSCProducts *products;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic, strong) UIPercentDrivenInteractiveTransition *interactiveAnimator;

@end

@implementation MJSCShopVC


-(id) initWithProducts:(MJSCProducts*)products {
    
    if (self = [super init]) {
        _products = products;
    }
    
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Registro el nibName de la celda
    [self.collectionView registerNib:[UINib nibWithNibName:@"MJSCCell" bundle:nil] forCellWithReuseIdentifier:kCellIdentifier];
    
    // Registro el nombre de la cabecera
    [self.collectionView registerNib:[UINib nibWithNibName:@"MJSCSectionHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kCellIdentifier];
    
    
}

// Nos ponemos como delegado del navigation coroller

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.navigationController.delegate = self;

}

// Quitamos el delegado del navigation controller
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
//    if (self.navigationController.delegate == self) {
//        self.navigationController.delegate = nil;
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.products sectionCount];
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.products countProductsAtSection:section];
}



-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //NSLog([NSString stringWithFormat:@"Celda %ld en seccion %ld"], indexPath.section, indexPath.row);
    
    MJSCProduct *product = [self.products productAtSection:indexPath.section index:indexPath.row];
    
    MJSCProductDetailsVC *productDetailsVC = [[MJSCProductDetailsVC alloc] initWithProduct:product];
    
    // Crear el reconocedor de gestos para pasarselo al destino
    
    
    
    UIScreenEdgePanGestureRecognizer *edgeRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgeGestureRecognizer:)];
    edgeRecognizer.edges = UIRectEdgeLeft;
    productDetailsVC.recognizer = edgeRecognizer;
    

    [self.navigationController pushViewController:productDetailsVC
                                         animated:YES];
    
    // Para las animaciones personalizadas con present sin viewController:
    //    productDetailsVC.modalPresentationStyle = UIModalPresentationCustom;
    //    productDetailsVC.transitioningDelegate = self;
    //
    //    [self presentViewController:productDetailsVC animated:YES completion:nil];

    
}



// Celda
-(UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    MJSCCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    // Get the section name
    
    
    // Get the product by section and id
    
    MJSCProduct *product = [self.products productAtSection:indexPath.section index:indexPath.row];
    
    cell.productImage.image = product.productImage;
    cell.productName.text = product.productName;
    cell.productPrice.text = [product.productPrice stringValue];

    
    return cell;
    
}


// Cabecera

// Cabeceras o pies
-(UICollectionReusableView*) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        // Me está pidiendo la cabecera
        MJSCSectionHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
        
        header.sectionName.text = [self.products sectionAtSectionId:indexPath.section];
        
        
        return header;
        
    } else {
        return nil;
    }
}


#pragma mark - Animaciones

-(id<UIViewControllerAnimatedTransitioning>) animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    MJSCAnimator *animator = [[MJSCAnimator alloc] init];
    animator.animationType = AnimatorPresent;
    
    return animator;
}

-(id<UIViewControllerAnimatedTransitioning>) animationControllerForDismissedController:(UIViewController *)dismissed {
    MJSCAnimator *animator = [[MJSCAnimator alloc] init];
    animator.animationType = AnimatorDismiss;
    
    return animator;
    
}


// Animaciones para el push con el navigation controller

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    MJSCAnimator *animator = [[MJSCAnimator alloc] init];
    
    if (operation == UINavigationControllerOperationPush) {
        animator.animationType = AnimatorPush;
    } else if (operation == UINavigationControllerOperationPop){
        animator.animationType = AnimatorPop;
    } else {
        animator = nil;
    }
    
    return animator;
}



# pragma mark - Animaciones para transiciones interactivas

// Transiciones interactivas

-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                        interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.interactiveAnimator;
}

-(void)edgeGestureRecognizer:(UIScreenEdgePanGestureRecognizer*)recognizer {
    
    // Detectamos el progreso del gesto
    float progreess = [recognizer translationInView:self.view].x / self.view.frame.size.width;
    
    // Empieza la transcición (detecta el gesto)
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.interactiveAnimator = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
        // La transición se está realizando, así que pillamos el progreso de la misma para pasarsela
        // al animador
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        [self.interactiveAnimator updateInteractiveTransition:progreess];
    } else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
        
        if (progreess > 0.2) {
            [self.interactiveAnimator finishInteractiveTransition];
        } else {
            [self.interactiveAnimator cancelInteractiveTransition];
        }
        
        self.interactiveAnimator = nil;
    }
    
    
    
}




@end
