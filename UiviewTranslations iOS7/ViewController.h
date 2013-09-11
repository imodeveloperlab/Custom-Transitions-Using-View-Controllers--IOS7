//
//  ViewController.h
//  UiviewTranslations iOS7
//
//  Created by Borinschi Ivan on 9/11/13.
//  Copyright (c) 2013 Winify AG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>
@property (strong, nonatomic) IBOutlet UIView *transportedView;

@end
