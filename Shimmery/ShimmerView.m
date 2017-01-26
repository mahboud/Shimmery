//
//  ShimmerView.m
//  Shimmery
//
//  Created by mahboud on 1/24/17.
//  Copyright © 2017 Optimized. All rights reserved.
//

#import "ShimmerView.h"

@interface ShimmerView () <CAAnimationDelegate>

@end

@implementation ShimmerView
{
	CAGradientLayer *_gradient;
}

+(Class)layerClass {
	return [CAGradientLayer class];
}

- (void)commonInit
{
	_gradient = (id)[self layer];
	_gradient.startPoint = CGPointMake(0.0,0.40);
	_gradient.endPoint = CGPointMake(1.0,0.5);
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self commonInit];
		CGRect frame = self.bounds;
		_gradient.frame = frame;
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self commonInit];
	}
	return self;
}

- (void)startShimmer {
	[self doShimmer];
}

- (void)doShimmer {
	_gradient.colors = @[
						 (id)[UIColor colorWithWhite:0.0 alpha:1.0].CGColor,
						 (id)[UIColor colorWithWhite:0.0 alpha:1.0-_shimmerOpacity].CGColor,
						 (id)[UIColor colorWithWhite:0.0 alpha:1.0].CGColor,
						 (id)[UIColor colorWithWhite:0.0 alpha:1.0-_shimmerOpacity].CGColor,
						 (id)[UIColor colorWithWhite:0.0 alpha:1.0].CGColor];
	
	NSArray *newLocations = @[@(1.0),
							  @(1.0 + _shimmerWidth),
							  @(1.0 + 2*_shimmerWidth),
							  @(1.0 + 3*_shimmerWidth),
							  @(1.0 + 4*_shimmerWidth)];
	NSArray *oldLocations = @[@(-4*_shimmerWidth),
							  @(-3*_shimmerWidth),
							  @(-2*_shimmerWidth),
							  @(-1*_shimmerWidth),
							  @(0*_shimmerWidth)] ;
	CABasicAnimation *startPointAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
	[startPointAnimation setDuration:_shimmerSpeed];
	[startPointAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	[startPointAnimation setFromValue:oldLocations];
	[startPointAnimation setToValue:newLocations];
	//  [startPointAnimation setFillMode:kCAFillModeForwards];
	//  [startPointAnimation setRemovedOnCompletion:YES];
	[startPointAnimation setDelegate:self];
	[_gradient setLocations:newLocations];
	[_gradient addAnimation:startPointAnimation forKey:@"locations"];
}

- (void)animationDidStop:(CAAnimation *)animation finished:(BOOL)flag {
	[self doShimmer];
}

@end
