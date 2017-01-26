//
//  ViewController.m
//  Shimmery
//
//  Created by mahboud on 1/19/17.
//  Copyright © 2017 Optimized. All rights reserved.
//

#import "ViewController.h"
#import "ShimmerLabel.h"
#import "ShimmerView.h"

@interface ViewController ()
{
	ShimmerLabel *_shimmerLabel;
}
@property (weak, nonatomic) IBOutlet UISlider *shimmerSpeedSlider;
@property (weak, nonatomic) IBOutlet UISlider *shimmerOpacity;
@property (weak, nonatomic) IBOutlet UISlider *shimmerWidthSlider;
@property (weak, nonatomic) IBOutlet ShimmerView *shimmerView;
@property (weak, nonatomic) IBOutlet UIButton *shimmerButton;
@property (strong, nonatomic) ShimmerView *shimmerView2;
@property (strong, nonatomic) ShimmerView *shimmerView3;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	_shimmerLabel = [[ShimmerLabel alloc] initWithFrame:CGRectMake(0, 0, 240, 48)];
	_shimmerLabel.text = @"Shimmer Me!";
	_shimmerLabel.textColor = UIColor.whiteColor;
	_shimmerLabel.font = [UIFont systemFontOfSize:40];
	_shimmerLabel.center = self.view.center;
	[self.view addSubview:_shimmerLabel];
	_shimmerLabel.shimmerSpeed = -_shimmerSpeedSlider.value;
	_shimmerLabel.shimmerOpacity = _shimmerOpacity.value;
	_shimmerLabel.shimmerWidth = _shimmerWidthSlider.value;
	[_shimmerLabel startShimmer];

	_shimmerView.shimmerSpeed = -_shimmerSpeedSlider.value;
	_shimmerView.shimmerOpacity = _shimmerOpacity.value;
	_shimmerView.shimmerWidth = _shimmerWidthSlider.value;
	[_shimmerView startShimmer];
	
	_shimmerView2 = [[ShimmerView alloc] initWithFrame:self.view.frame];
	_shimmerView2.shimmerSpeed = -_shimmerSpeedSlider.value;
	_shimmerView2.shimmerOpacity = _shimmerOpacity.value;
	_shimmerView2.shimmerWidth = _shimmerWidthSlider.value;
	[_shimmerView2 startShimmer];
	self.view.maskView = _shimmerView2;
// or
//	self.view.layer.mask = _shimmerView2.layer;
	
	_shimmerView3 = [[ShimmerView alloc] initWithFrame:_shimmerButton.frame];
	_shimmerView3.shimmerSpeed = -_shimmerSpeedSlider.value;
	_shimmerView3.shimmerOpacity = _shimmerOpacity.value;
	_shimmerView3.shimmerWidth = _shimmerWidthSlider.value;
	[_shimmerView3 startShimmer];
	_shimmerButton.maskView = _shimmerView3;
// or
//	_shimmerButton.layer.mask = _shimmerView3.layer;
	
	self.view.backgroundColor = UIColor.whiteColor;
	_shimmerLabel.textColor = UIColor.blackColor;

}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)speedChanged:(id)sender {
	_shimmerLabel.shimmerSpeed = -_shimmerSpeedSlider.value;
}

- (IBAction)opacityChanged:(id)sender {
	_shimmerLabel.shimmerOpacity = _shimmerOpacity.value;
}
- (IBAction)widthChanged:(id)sender {
	_shimmerLabel.shimmerWidth = _shimmerWidthSlider.value;
}

@end
