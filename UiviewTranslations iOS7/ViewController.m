//
//  ViewController.m
//  UiviewTranslations iOS7
//
//  Created by Borinschi Ivan on 9/11/13.
//  Copyright (c) 2013 Winify AG. All rights reserved.
//

#import "ViewController.h"
#import "UiviewAnimationsViewController.h"
#import "FromCollection.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)customTransition:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UiviewAnimationsViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"UiviewAnimationsViewController"];
    vc.backAnimation = YES;
    vc.modalPresentationStyle = UIModalPresentationCustom;
    [vc setTransitioningDelegate:self];
    [self presentViewController:vc animated:YES completion:^{ }];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source
{
    return self;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 40;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *inView = [transitionContext containerView];
    ViewController *fromVC = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UiviewAnimationsViewController *toVC = (UiviewAnimationsViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [inView addSubview:toVC.view];
    toVC.view.frame = CGRectMake(320,-320, 320, 480);
    fromVC.view.frame = CGRectMake(0, 0, 320, 480);
    [inView addSubview:fromVC.transportedView];
    [inView bringSubviewToFront:fromVC.transportedView];

    [UIView animateWithDuration:0.7f
                          delay:0
         usingSpringWithDamping:1
          initialSpringVelocity:1.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         fromVC.transportedView.frame = CGRectMake(100, 180, 120, 100);
                         fromVC.view.frame = CGRectMake(-320, 0, 320, 480);
                         CGRect screenRect = [[UIScreen mainScreen] bounds];
                         toVC.view.center = CGPointMake(screenRect.size.width/2, screenRect.size.height/2);
                         toVC.view.backgroundColor = [UIColor whiteColor];
                        
                         
                     } completion:^(BOOL finished)
     {
         
         [toVC.view addSubview:fromVC.transportedView];
         toVC.itemC = fromVC.transportedView;
         [transitionContext completeTransition:YES];
     }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[FromCollection class]])
    {
        FromCollection *vc = (FromCollection*)segue.destinationViewController;
        vc.useLayoutToLayoutNavigationTransitions = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
