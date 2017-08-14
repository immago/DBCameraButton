//
//  DBCameraButton.h
//  DBCameraButton
//
//  Created by Dmitry Byankin on 06.08.17.
//  Copyright © 2017 Dmitry Byankin. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface DBCameraButton : UIButton
{
    CAShapeLayer *pathLayer;
}

/// Duration of animation
@property (nonatomic) IBInspectable CGFloat animationDuration;

/// If YES display "stop" square, else display "capture" circle
@property (nonatomic) IBInspectable BOOL isRecording;

/// Color of "capture" circle
@property (nonatomic, strong) IBInspectable UIColor *circleColor;

/// Color of "stop" square
@property (nonatomic, strong) IBInspectable UIColor *squareColor;

/// Color of outer ring
@property (nonatomic, strong) IBInspectable UIColor *outerRingColor;

/// Color in disabled state
@property (nonatomic, strong) IBInspectable UIColor *disabledColor;

/// Width of outer ring
@property (nonatomic) IBInspectable CGFloat outerRingWidth;

/// Space between outer ring and inner shape
@property (nonatomic) IBInspectable CGFloat outerRingSpacing;

/// Corner radius of "stop" square
@property (nonatomic) IBInspectable CGFloat squareCornerRadius;

/// Change state when button pressed. Default YES. Set NO to manual state change
@property (nonatomic) IBInspectable BOOL autoStateChange;

/// Margin to rect bounds
@property (nonatomic) IBInspectable CGFloat margin;

@end
