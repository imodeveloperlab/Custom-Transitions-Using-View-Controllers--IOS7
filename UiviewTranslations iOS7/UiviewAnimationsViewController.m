//
//  UiviewAnimationsViewController.m
//  UiviewTranslations iOS7
//
//  Created by Borinschi Ivan on 9/11/13.
//  Copyright (c) 2013 Winify AG. All rights reserved.
//

#import "UiviewAnimationsViewController.h"
#import "ViewController.h"

@interface UiviewAnimationsViewController ()
@end

@implementation UiviewAnimationsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) { }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)springAnimation:(id)sender
{
    [UIView animateWithDuration:0.5f
                          delay:0
         usingSpringWithDamping:0.4
          initialSpringVelocity:20.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         _itemA.frame = CGRectMake(self.itemA.frame.origin.x,self.itemA.frame.origin.y, 100, 100);
                         _itemB.frame = CGRectMake(self.itemB.frame.origin.x,self.itemB.frame.origin.y, 50, 50);
                         _itemC.frame = CGRectMake(self.itemC.frame.origin.x,self.itemC.frame.origin.y, 25, 25);
                         _itemA.center = CGPointMake(320/2, 300);
                         _itemB.center = CGPointMake(320/2, 205);
                         _itemC.center = CGPointMake(320/2, 150);
                         
                         
                     } completion:^(BOOL finished) { }];
}

- (IBAction)keyframeAnimation:(id)sender
{
    [UIView animateKeyframesWithDuration:1 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            
            _itemA.frame = CGRectMake(self.itemA.frame.origin.x,self.itemA.frame.origin.y, 25, 25);
            _itemB.frame = CGRectMake(self.itemB.frame.origin.x,self.itemB.frame.origin.y, 50, 50);
            _itemC.frame = CGRectMake(self.itemC.frame.origin.x,self.itemC.frame.origin.y, 100, 100);
            _itemB.center = CGPointMake(100, 0);
            _itemA.center = CGPointMake(200, 100);
            _itemC.center = CGPointMake(300, 300);
            
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
            
            _itemA.center = CGPointMake(50, 200);
            _itemB.center = CGPointMake(125, 200);
            _itemC.center = CGPointMake(225, 200);
            
        }];
        
    } completion:^(BOOL finished) { }];
}


- (IBAction)addLabel:(id)sender
{
    for (UILabel *label in [_itemC subviews])  {
        [label removeFromSuperview];
        return;
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
    label.text = @"iOS7";
    [_itemC addSubview:label];
    
}

- (IBAction)keframe2Animation:(id)sender
{
    [UIView animateKeyframesWithDuration:2 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            
            _itemA.frame = CGRectMake(self.itemA.frame.origin.x,self.itemA.frame.origin.y, 25, 25);
            _itemB.frame = CGRectMake(self.itemB.frame.origin.x,self.itemB.frame.origin.y, 50, 50);
            _itemC.frame = CGRectMake(self.itemC.frame.origin.x,self.itemC.frame.origin.y, 100, 100);
            _itemB.center = CGPointMake(100, 0);
            _itemA.center = CGPointMake(200, 100);
            _itemC.center = CGPointMake(300, 300);
            
        }];
        
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
            
            _itemA.center = CGPointMake(275, 200);
            _itemB.center = CGPointMake(200, 200);
            _itemC.center = CGPointMake(100, 200);
            
        }];
        
    } completion:^(BOOL finished) {  }];
}

- (IBAction)close:(id)sender
{
    if (self.backAnimation) {
       [self setTransitioningDelegate:self];
        self.backAnimation = NO;
    }
    
    [self dismissViewControllerAnimated:YES completion:^{ }];
}


- (id <UIViewControllerAnimatedTransitioning>) animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 40;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *inView = [transitionContext containerView];
    UiviewAnimationsViewController *fromVC = (UiviewAnimationsViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController *toVC = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [inView addSubview:toVC.view];
    toVC.view.frame = CGRectMake(-320,0, 320, 480);
    fromVC.view.frame = CGRectMake(0, 0, 320, 480);
    
    [inView addSubview:fromVC.itemC];
    [inView bringSubviewToFront:fromVC.itemC];
    
    [UIView animateWithDuration:1.0f
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:1.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         
                         fromVC.view.frame = CGRectMake(320, 0, 320, 480);
                         CGRect screenRect = [[UIScreen mainScreen] bounds];
                         toVC.view.center = CGPointMake(screenRect.size.width/2, screenRect.size.height/2);
                         toVC.view.backgroundColor = [UIColor whiteColor];
                         toVC.transportedView.frame = CGRectMake(20,200, 280 , 250);
                         
                         
                     } completion:^(BOOL finished)
     {
         
         [toVC.view addSubview:fromVC.itemC];
         toVC.transportedView = fromVC.itemC;
         [transitionContext completeTransition:YES];
         
     }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
