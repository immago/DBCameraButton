# DBCameraButton
Customizable, IB_DESIGNABLE, iOS style camera button.

![image](https://user-images.githubusercontent.com/5740772/29002628-5ec56d38-7aaf-11e7-85a4-4810e918784f.gif)

## Usage
Create button of DBCameraButton class in storyboard or programmatically. No additional configuration needed.

## Properties
```
CGFloat animationDuration - duration of animation
BOOL isRecording - if YES display "stop" square, else display "capture" circle
UIColor *circleColor - color of "capture" circle
UIColor *squareColor - color of "stop" square
UIColor *outerRingColor - color of outer ring
UIColor *disabledColor - color in disabled state
CGFloat outerRingWidth - width of outer ring
CGFloat outerRingSpacing - space between outer ring and inner shape
CGFloat squareCornerRadius - corner radius of "stop" square
BOOL autoStateChange - change state when button pressed. Default YES. Set NO to manual state change.
CGFloat margin - margin to rect bounds.
```
