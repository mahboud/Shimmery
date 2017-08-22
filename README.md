# Shimmery

Shimmery is an app built around a UIView class, ShimmerView that allows you to add a Shimmer effect to any view heirarchy.  
![image](https://raw.github.com/mahboud/Shimmery/master/Shimmery.gif)

The Shimmer effect could be a way to emphasize a control item, or some task that is in progress.

## Usage

To add Shimmer to any view, which would also add shimmer to all of that view's subviews, you merely add the ShimmerView to the mask:

  _targetView.maskView = _shimmerView;
// or
  _targetView.view.layer.mask = _shimmerView.layer;

