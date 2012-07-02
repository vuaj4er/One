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
@property (nonatomic) CGRect boxRect;
@property (nonatomic, weak) UIImage *smartImage;
@property (nonatomic) CGRect smartRect;
@property (nonatomic, weak) UIImage *moneyImage;
@property (nonatomic) CGRect moneyRect;

@end

@implementation BoardView

@synthesize boxImage = _boxImage;
@synthesize boxRect = _boxRect;
@synthesize smartImage = _smartImage;
@synthesize smartRect = _smartRect;
@synthesize moneyImage = _moneyImage;
@synthesize moneyRect = _moneyRect;

@synthesize dataSource = _dataSource;

- (UIImage *)boxImage
{
    if (!_boxImage) {
        self.boxRect = [self.dataSource boxLocInBoardView:self];;
        _boxImage = [UIImage imageNamed:@"box.jpg"];
    }
    return _boxImage;
}

- (UIImage *)smartImage
{
    if (!_smartImage) {
        self.smartRect = [self.dataSource smartLocInBoardView:self];;
        _smartImage = [UIImage imageNamed:@"smart.jpg"];
    }
    return _smartImage;
}

- (UIImage *)moneyImage
{
    if (!_moneyImage) {
        self.moneyRect = [self.dataSource moneyLocInBoardView:self];;
        _moneyImage = [UIImage imageNamed:@"money.jpg"];
    }
    return _moneyImage;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //NSLog(@"initWithFrame");
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect r = [self.dataSource boxLocInBoardView:self];
    //if (!CGRectEqualToRect(r, self.boxRect)) {
        [self.boxImage drawInRect:r];        
    //}
    r = [self.dataSource moneyLocInBoardView:self];
    if (!CGRectEqualToRect(r, self.smartRect)) {
        [self.moneyImage drawInRect:r];
    }
    r = [self.dataSource smartLocInBoardView:self];
    if (!CGRectEqualToRect(r, self.moneyRect)) {
        [self.smartImage drawInRect:r];
    }

}


@end
