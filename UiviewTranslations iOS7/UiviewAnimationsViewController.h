//
//  UiviewAnimationsViewController.h
//  UiviewTranslations iOS7
//
//  Created by Borinschi Ivan on 9/11/13.
//  Copyright (c) 2013 Winify AG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UiviewAnimationsViewController : UIViewController<UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>
@property (strong, nonatomic) IBOutlet UIView *itemA;
@property (strong, nonatomic) IBOutlet UIView *itemB;
@property (strong, nonatomic)  UIView *itemC;
@property (nonatomic,assign) BOOL backAnimation;

@end
