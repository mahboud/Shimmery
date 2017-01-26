//
//  ShimmerLabel.h
//  Shimmery
//
//  Created by mahboud on 1/19/17.
//  Copyright © 2017 Optimized. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShimmerLabel : UILabel
@property (nonatomic) CGFloat shimmerWidth;
@property (nonatomic) CGFloat shimmerOpacity;
@property (nonatomic) NSTimeInterval shimmerSpeed;

- (void)startShimmer;
@end
