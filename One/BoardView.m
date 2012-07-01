//
//  BoardView.m
//  One
//
//  Created by Lion User on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoardView.h"

@interface BoardView()

@property (nonatomic, weak) UIImage *smartImage;
@property (nonatomic) CGPoint smartPoint;

@end

@implementation BoardView

@synthesize smartImage = _smartImage;
@synthesize smartPoint = _smartPoint;

- (UIImage *)smartImage
{
    if (!_smartImage) {
        self.smartPoint = CGPointMake(20, 30);
        _smartImage = [UIImage imageNamed:@"smart.jpg"];
    }
    return _smartImage;
}

-(void)setSmartPoint:(CGPoint)smartPoint
{
    //if (_smartPoint != smartPoint) {
        _smartPoint = smartPoint;
        [self setNeedsDisplay];
    //}
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.smartImage drawAtPoint:self.smartPoint];
        NSLog(@"initWithFrame");
    }
    return self;
}

- (void)pan:(UIPanGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        CGPoint translation = [gesture translationInView:self];
        self.smartPoint = CGPointMake(self.smartPoint.x + translation.x, self.smartPoint.y + translation.y);
        [gesture setTranslation:CGPointZero inView:self];
    }
}

- (void)drawRect:(CGRect)rect
{
    [self.smartImage drawAtPoint:self.smartPoint];
}


@end
