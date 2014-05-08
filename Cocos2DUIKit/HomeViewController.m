//
//  HomeViewController.m
//  Cocos2DUIKit
//
//  Created by Luke Rogers on 26/04/2014.
//  Copyright (c) 2014 Rizer. All rights reserved.
//

#import "HomeViewController.h"

#import "PXKFadeTransition.h"

#import "Cocos2DViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController


- (instancetype)init
{
	self = [super init];
	
	if (self)
	{
		UIBarButtonItem *newButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(showCocos2DView:)];
		[[self navigationItem] setRightBarButtonItem:newButtonItem];
		
		
	}
	
	return self;
}

- (void)loadView
{
	[super loadView];
	
	[self setView:[[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
	
	[[self view] setBackgroundColor:[UIColor greenColor]];
	
	[[self navigationController] setDelegate:self];
}

- (void)showCocos2DView:(id)sender
{
	Cocos2DViewController *cocosVC = [[Cocos2DViewController alloc] init];
	[[self navigationController] pushViewController:cocosVC animated:YES];
}

#pragma mark - UINavigationControllerDelegate methods

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
								   animationControllerForOperation:(UINavigationControllerOperation)operation
												fromViewController:(UIViewController *)fromVC
												  toViewController:(UIViewController *)toVC
{
	if (operation == UINavigationControllerOperationPush || operation == UINavigationControllerOperationPop)
	{
		return [[PXKFadeTransition alloc] init];
	}
	return nil;
}


@end
