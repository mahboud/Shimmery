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
  BOOL _run;
}

+(Class)layerClass {
	return [CAGradientLayer class];
}

- (void)commonInit
{
	_gradient = (id)[self layer];
	_gradient.startPoint = CGPointMake(0.0,0.5);
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
  _run = YES;
  [self doShimmer];
}

- (void)stopShimmer {
  _run = NO;
}

- (void)doShimmer {
	_gradient.startPoint = CGPointMake(0.0,0.5);
	_gradient.endPoint = CGPointMake(1.0,0.5);

	_gradient.colors = @[
						 (id)[UIColor colorWithWhite:1.0 alpha:1.0].CGColor,
						 (id)[UIColor colorWithWhite:0.0 alpha:1.0 - _shimmerOpacity].CGColor,
						 (id)[UIColor colorWithWhite:1.0 alpha:1.0].CGColor
						 ];

	NSArray *newLocations = @[@(1.0),
							  @(1.0 + _shimmerWidth),
							  @(1.0 + 2 * _shimmerWidth)];
	NSArray *oldLocations = @[@(-3 * _shimmerWidth),
							  @(-2 * _shimmerWidth),
							  @(- _shimmerWidth)];

	CABasicAnimation *locationsAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
	[locationsAnimation setDuration:_shimmerDuration];
	[locationsAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	[locationsAnimation setFromValue:oldLocations];
	[locationsAnimation setToValue:newLocations];
	//  [locationsAnimation setFillMode:kCAFillModeForwards];
	//  [locationsAnimation setRemovedOnCompletion:YES];
	[locationsAnimation setDelegate:self];
	[_gradient setLocations:newLocations];
	[_gradient addAnimation:locationsAnimation forKey:@"just location change"];
}

- (void)animationDidStop:(CAAnimation *)animation finished:(BOOL)flag {
  if (_run) {
    [self doShimmer];
  }
}

@end
