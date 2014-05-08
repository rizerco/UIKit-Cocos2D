//
//  PXKFadeTransition.m
//  Pixaki
//
//  Created by Luke Rogers on 02/04/2014.
//  Copyright (c) 2014 Rizer. All rights reserved.
//

#import "PXKFadeTransition.h"

@implementation PXKFadeTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
	return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
	UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
	UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
	[[transitionContext containerView] addSubview:toViewController.view];
	toViewController.view.alpha = 0;
	
	[UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
		toViewController.view.alpha = 1;
	} completion:^(BOOL finished) {
		fromViewController.view.transform = CGAffineTransformIdentity;
		[transitionContext completeTransition:![transitionContext transitionWasCancelled]];
		
	}];
	
}

@end
