//
//  BoardView.m
//  One
//
//  Created by Lion User on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoardView.h"

@interface BoardView()

@property (nonatomic, weak) UIImage *setImage;
//@property (nonatomic) CGRect setRect;
@property (nonatomic, weak) UIImage *smartImage;
//@property (nonatomic) CGRect smartRect;

@end

@implementation BoardView

@synthesize setImage = _setImage;
//@synthesize setRect = _setRect;
@synthesize smartImage = _smartImage;
//@synthesize smartRect = _smartRect;

@synthesize dataSource = _dataSource;

- (UIImage *)setImage
{
    if (!_setImage) {
        //self.setRect = CGRectMake(30, 520, 3008*0.2, 2000*0.2);
        _setImage = [UIImage imageNamed:@"set.jpg"];
    }
    return _setImage;
}

- (UIImage *)smartImage
{
    if (!_smartImage) {
        //self.smartRect = CGRectMake(20, 30, 386*0.8, 313*0.8);
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
    //[self.setImage drawInRect:self.setRect];
    //[self.smartImage drawInRect:self.smartRect];
    [self.setImage drawInRect:[self.dataSource setLocInBoardView:self]];
    [self.smartImage drawInRect:[self.dataSource smartLocInBoardView:self]];

}


@end
