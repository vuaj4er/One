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
@property (nonatomic, weak) UIImage *bookImage;
@property (nonatomic) CGRect bookRect;
@property (nonatomic, weak) UIImage *drawImage;
@property (nonatomic) CGRect drawRect;

@end

@implementation BoardView

@synthesize boxImage = _boxImage;
@synthesize boxRect = _boxRect;
@synthesize smartImage = _smartImage;
@synthesize smartRect = _smartRect;
@synthesize moneyImage = _moneyImage;
@synthesize moneyRect = _moneyRect;
@synthesize bookImage = _bookImage;
@synthesize bookRect = _bookRect;
@synthesize drawImage = _drawImage;
@synthesize drawRect = _drawRect;

@synthesize dataSource = _dataSource;

- (void)setup
{
    //NSLog(@"setup");
    //[self.dataSource locSetToDefault];
    self.contentMode = UIViewContentModeRedraw; 
}

- (void)awakeFromNib
{
    //NSLog(@"awakeFromNib");
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    //NSLog(@"initWithFrame");
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

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
        _smartImage = [UIImage imageNamed:@"smart.png"];
    }
    return _smartImage;
}

- (UIImage *)moneyImage
{
    if (!_moneyImage) {
        self.moneyRect = [self.dataSource moneyLocInBoardView:self];;
        _moneyImage = [UIImage imageNamed:@"money.png"];
    }
    return _moneyImage;
}

- (UIImage *)bookImage
{
    if (!_bookImage) {
        self.bookRect = [self.dataSource bookLocInBoardView:self];;
        _bookImage = [UIImage imageNamed:@"book.png"];
    }
    return _bookImage;
}

- (UIImage *)drawImage
{
    if (!_drawImage) {
        self.drawRect = [self.dataSource drawLocInBoardView:self];;
        _drawImage = [UIImage imageNamed:@"draw.png"];
    }
    return _drawImage;
}

- (void)drawRect:(CGRect)rect
{
    CGRect r = [self.dataSource boxLocInBoardView:self];
    //if (!CGRectEqualToRect(r, self.boxRect)) {
        [self.boxImage drawInRect:r];        
    //}
    r = [self.dataSource moneyLocInBoardView:self];
    //if (!CGRectEqualToRect(r, self.moneyRect)) {
        [self.moneyImage drawInRect:r];
    //}
    r = [self.dataSource smartLocInBoardView:self];
    //if (!CGRectEqualToRect(r, self.smartRect)) {
        [self.smartImage drawInRect:r];
    //}
    r = [self.dataSource bookLocInBoardView:self];
    //if (!CGRectEqualToRect(r, self.bookRect)) {
        [self.bookImage drawInRect:r];
    //}
    r = [self.dataSource drawLocInBoardView:self];
    //if (!CGRectEqualToRect(r, self.drawRect)) {
        [self.drawImage drawInRect:r];
    //}

}


@end
