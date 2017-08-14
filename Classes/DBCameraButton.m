//
//  DBCameraButton.m
//  DBCameraButton
//
//  Created by Dmitry Byankin on 06.08.17.
//  Copyright © 2017 Dmitry Byankin. All rights reserved.
//

#import "DBCameraButton.h"

@implementation DBCameraButton

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup {

    if(!self.circleColor){
        self.circleColor = [UIColor redColor];
    }
    
    if(!self.squareColor){
        self.squareColor = [UIColor redColor];
    }
    
    if(!self.outerRingColor){
        self.outerRingColor = [UIColor whiteColor];
    }

    if(!self.disabledColor){
        self.disabledColor = [UIColor grayColor];
    }
    
    self.outerRingWidth = 6.f;
    self.outerRingSpacing = 3.f;
    self.squareCornerRadius = 4.0f;
    self.animationDuration = 0.4f;
    self.autoStateChange = YES;
    self.margin = 5.f;
    
    // setup inner shape
    pathLayer = [[CAShapeLayer alloc]init];
    pathLayer.path = [self currentInnerPath].CGPath;
    pathLayer.strokeColor = [UIColor clearColor].CGColor;
    pathLayer.fillColor = [self innerColor].CGColor;

    [self.layer addSublayer:pathLayer];
}

-(void)awakeFromNib {
    [super awakeFromNib];
    

    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:1
                                                      constant:0]];
    
    [self setTitle:@"" forState:UIControlStateNormal];
    pathLayer.fillColor = [self innerColor].CGColor;
    pathLayer.path = [self currentInnerPath].CGPath;
    

    [self addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
}



-(void)prepareForInterfaceBuilder {

    [self setTitle:@"" forState:UIControlStateNormal];
    pathLayer.fillColor = [self innerColor].CGColor;
    pathLayer.path = [self currentInnerPath].CGPath;
}

-(void)setIsRecording:(BOOL)isRecording {
    _isRecording = isRecording;
    
    // If isRecording == YES display square, else circle
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = self.animationDuration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.toValue = (__bridge id _Nullable)([self currentInnerPath].CGPath);
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;

    [pathLayer addAnimation:animation forKey:@""];
    
    // color
    CABasicAnimation *colorChange = [CABasicAnimation animationWithKeyPath:@"fillColor"];
    colorChange.duration = self.animationDuration;
    colorChange.toValue = (__bridge id _Nullable)([self innerColor].CGColor);
    colorChange.fillMode = kCAFillModeForwards;
    colorChange.removedOnCompletion = NO;
    colorChange.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [pathLayer addAnimation:colorChange forKey:@"fillColor"];
}

#pragma mark - BezierPath

-(UIBezierPath*)currentInnerPath {
    
    return self.isRecording ? [self innerSquarePath] : [self innerCirclePath];
    
}

-(UIBezierPath*)innerCirclePath {
    CGFloat size = self.frame.size.width - self.outerRingWidth*2 - self.outerRingSpacing*2 - self.margin*2;
    return [UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.outerRingWidth + self.outerRingSpacing + self.margin,
                                                              self.outerRingWidth + self.outerRingSpacing + self.margin,
                                                              size, size) cornerRadius:size/2.f];
}

-(UIBezierPath*)innerSquarePath {
    CGFloat circleSize = self.frame.size.width - self.outerRingWidth*2 - self.outerRingSpacing*2 - self.margin*2;
    CGFloat size = circleSize * sqrt(2) / 2.f;
    CGFloat margin = (circleSize - size) / 2.f + self.outerRingWidth + self.outerRingSpacing + self.margin;
    
    return [UIBezierPath bezierPathWithRoundedRect:CGRectMake(margin, margin, size, size) cornerRadius:self.squareCornerRadius];
}

-(UIColor*)innerColor {
    
    return self.enabled ? (self.isRecording ? self.squareColor
                           : self.circleColor)
    : self.disabledColor;
}

#pragma mark - Setters

-(void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    pathLayer.fillColor = [self innerColor].CGColor;
    
}

#pragma mark - Touches

-(void)touchUpInside:(UIButton*)sender {
    
    // Touch ended. Display view as usual
    if(self.autoStateChange){
        self.isRecording = !self.isRecording;
    }

    CABasicAnimation *colorChange = [CABasicAnimation animationWithKeyPath:@"fillColor"];
    colorChange.duration = self.animationDuration;
    colorChange.toValue = (__bridge id _Nullable)([self innerColor].CGColor);
    colorChange.fillMode = kCAFillModeForwards;
    colorChange.removedOnCompletion = NO;
    colorChange.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    [pathLayer addAnimation:colorChange forKey:@"darkColor"];
}

-(void)touchDown:(UIButton*)sender {
    
    // Touch start. Display button pressed state.
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"fillColor"];
    animation.duration = self.animationDuration;
    animation.toValue = (__bridge id _Nullable)([[self innerColor] colorWithAlphaComponent:0.5f].CGColor);
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [pathLayer addAnimation:animation forKey:@""];
}


#pragma mark - Draw methods

-(void)drawRect:(CGRect)rect {
    
    UIBezierPath *outerRing = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.outerRingWidth/2.f + self.margin,
                                                                                self.outerRingWidth/2.f + self.margin,
                                                                                self.frame.size.width - self.outerRingWidth - self.margin*2,
                                                                                self.frame.size.width - self.outerRingWidth - self.margin*2)];
    outerRing.lineWidth = self.outerRingWidth;
    [(self.enabled ? self.outerRingColor : self.disabledColor) setStroke];
    [outerRing stroke];
}



@end
