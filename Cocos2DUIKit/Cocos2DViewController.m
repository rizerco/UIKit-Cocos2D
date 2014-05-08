//
//  Cocos2DViewController.m
//  Cocos2DUIKit
//
//  Created by Luke Rogers on 26/04/2014.
//  Copyright (c) 2014 Rizer. All rights reserved.
//

#import "Cocos2DViewController.h"

#import "cocos2d.h"

@interface Cocos2DViewController ()

@end

@implementation Cocos2DViewController

- (instancetype)init
{
	self = [super init];
	if (self)
	{
		CCDirectorIOS *director = (CCDirectorIOS *)[CCDirector sharedDirector];
		[director setDisplayStats:YES];
		[director setAnimationInterval:1.0/60.0];
		[director setFixedUpdateInterval:1.0/60.0];
		
		[director stopAnimation];
		[director pause];
		
		CCGLView *glView = [CCGLView viewWithFrame:CGRectMake(10, 80, 300, 300)];
		[director setView:glView];
		[glView setBackgroundColor:[UIColor blueColor]];
		
		[director setProjection:director.projection];

		[director resume];
		[director startAnimation];
		
		CCScene *scene = [CCScene node];
		CCNodeColor *background = [CCNodeColor nodeWithColor:[CCColor colorWithRed:0.7f green:0.2f blue:0.2f alpha:1.0f]];
		[scene addChild:background];
		
		[director replaceScene:scene];
		
	}
	return self;
}

- (void)loadView
{
	[super loadView];
	
	[self setView:[[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
	
	[[self view] setBackgroundColor:[UIColor redColor]];
	
	[[self view] addSubview:[[CCDirector sharedDirector] view]];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[[CCDirector sharedDirector] end];
}

@end
