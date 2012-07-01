//
//  BoardView.m
//  One
//
//  Created by Lion User on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoardView.h"

@interface BoardView()

@property (nonatomic, weak) UIImage *boxImage;
@property (nonatomic, weak) UIImage *smartImage;

@end

@implementation BoardView

@synthesize boxImage = _boxImage;
@synthesize smartImage = _smartImage;

@synthesize dataSource = _dataSource;

- (UIImage *)boxImage
{
    if (!_boxImage) {
        _boxImage = [UIImage imageNamed:@"box.jpg"];
    }
    return _boxImage;
}

- (UIImage *)smartImage
{
    if (!_smartImage) {
        _smartImage = [UIImage imageNamed:@"smart.jpg"];
    }
    return _smartImage;
}
/*
-(void)setSmartRect:(CGRect)smartRect
{
    //if (_smartRect != smartRect) {
        _smartRect = smartRect;
        [self setNeedsDisplay];
    //}
}

-(void)setSetRect:(CGRect)setRect
{
    _setRect = setRect;
    [self setNeedsDisplay];
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"initWithFrame");
    }
    return self;
}
/*
- (void)pan:(UIPanGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        CGPoint translation = [gesture translationInView:self];
        self.smartRect = CGRectMake(self.smartRect.origin.x + translation.x, self.smartRect.origin.y + translation.y, self.smartRect.size.width, self.smartRect.size.height);
        [gesture setTranslation:CGPointZero inView:self];
    }
}
*/
- (void)drawRect:(CGRect)rect
{
    //[self.boxImage drawInRect:self.setRect];
    //[self.smartImage drawInRect:self.smartRect];
    [self.boxImage drawInRect:[self.dataSource boxLocInBoardView:self]];
    [self.smartImage drawInRect:[self.dataSource smartLocInBoardView:self]];

}


@end
