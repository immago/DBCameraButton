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

@property (nonatomic) IBInspectable CGFloat animationDuration;
@property (nonatomic) IBInspectable BOOL isRecording;
@property (nonatomic, strong) IBInspectable UIColor *circleColor;
@property (nonatomic, strong) IBInspectable UIColor *squareColor;
@property (nonatomic, strong) IBInspectable UIColor *outerRingColor;
@property (nonatomic, strong) IBInspectable UIColor *disabledColor;
@property (nonatomic) IBInspectable CGFloat outerRingWidth;
@property (nonatomic) IBInspectable CGFloat outerRingSpacing;
@property (nonatomic) IBInspectable CGFloat squareCornerRadius;

@end
