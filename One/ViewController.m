//
//  ViewController.m
//  One
//
//  Created by Lion User on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "BoardView.h"
#import "OneBrain.h"

@interface ViewController () <BoardViewDataSource>

@property (nonatomic, strong) IBOutlet BoardView *boardView;
@property (nonatomic, strong) OneBrain *oneBrain;

//@property (nonatomic) CGRect currentStuff;
@property (nonatomic) int currentStuff;
@property (nonatomic) CGRect boxRect;
@property (nonatomic) CGRect smartRect;
@property (nonatomic) BOOL smartIsInsideBox;    //YES: inside, NO: outside
@property (nonatomic) CGRect moneyRect;
@property (nonatomic) BOOL moneyIsInsideBox;    //YES: inside, NO: outside


@end

@implementation ViewController

//@synthesize smartImage = _smartImage;
@synthesize boardView = _boardView;
@synthesize oneBrain = _oneBrain;

@synthesize currentStuff = _currentStuff;
@synthesize boxRect = _boxRect;
@synthesize smartRect = _smartRect;
@synthesize smartIsInsideBox = _smartIsInsideBox;
@synthesize moneyRect = _moneyRect;
@synthesize moneyIsInsideBox = _moneyIsInsideBox;

- (IBAction)resetPress:(UIButton *)sender
{
    [self locSetToDefault];
    [self.boardView setNeedsDisplay];
}

- (void)setBoardView:(BoardView *)boardView
{
    _boardView = boardView;
    [self locSetToDefault];
    
    //[self.boardView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self.boardView action:@selector(pan:)]];
    [self.boardView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)]];
    self.boardView.dataSource = self;
}

- (OneBrain *)oneBrain
{
    if (!_oneBrain) {
        _oneBrain = [[OneBrain alloc] init];
    }
    return _oneBrain;
}

-(void)setSmartRect:(CGRect)smartRect
{
    if (!CGRectEqualToRect(_smartRect, smartRect)) {
        if ([self.oneBrain ifStuff:smartRect insideBox:self.boxRect]) {
            self.smartIsInsideBox = YES;
        }
        _smartRect = smartRect;
        [self.boardView setNeedsDisplay];
    }
}

-(void)setMoneyRect:(CGRect)moneyRect
{
    if (!CGRectEqualToRect(_moneyRect, moneyRect)) {
        if ([self.oneBrain ifStuff:moneyRect insideBox:self.boxRect]) {
            self.moneyIsInsideBox = YES;
        }
        _moneyRect = moneyRect;
        [self.boardView setNeedsDisplay];
    }
}

-(void)setBoxRect:(CGRect)boxRect
{
    _boxRect = boxRect;
    [self.boardView setNeedsDisplay];
}

- (void)locSetToDefault
{    
    self.boxRect = CGRectMake(30, 520, 3008*0.2, 2000*0.2);
    self.smartRect = CGRectMake(20, 40, 386*0.8, 313*0.8);
    self.smartIsInsideBox = NO;
    self.moneyRect = CGRectMake(self.smartRect.origin.x + self.smartRect.size.width + 20, 30, 386*0.8, 313*0.8);
    self.moneyIsInsideBox = NO;
}

- (void)pan:(UIPanGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        CGPoint translation = [gesture translationInView:self.boardView];
        //if (CGRectEqualToRect(self.currentStuff, self.smartRect)) {
        if (self.currentStuff == 1) {
            self.smartRect = CGRectMake(self.smartRect.origin.x + translation.x, self.smartRect.origin.y + translation.y, self.smartRect.size.width, self.smartRect.size.height);
            //self.currentStuff = CGRectMake(self.smartRect.origin.x + translation.x, self.smartRect.origin.y + translation.y, self.smartRect.size.width, self.smartRect.size.height);
        }
        else if (self.currentStuff == 2) {
            self.moneyRect = CGRectMake(self.moneyRect.origin.x + translation.x, self.moneyRect.origin.y + translation.y, self.moneyRect.size.width, self.moneyRect.size.height);
        }
        [gesture setTranslation:CGPointZero inView:self.boardView];
    }
    else if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint p = [gesture locationInView:self.boardView];
        if ([self.oneBrain ifPoint:p insideRect:self.smartRect]) {
            //self.currentStuff = self.smartRect;
            self.currentStuff = 1;
        }
        else if ([self.oneBrain ifPoint:p insideRect:self.moneyRect]) {
            self.currentStuff = 2;
        }
        else {
            self.currentStuff = 0;
        }
    }
}

- (CGRect)smartLocInBoardView:(BoardView *)sender
{
    if (self.smartIsInsideBox) {
        return CGRectMake(self.boxRect.origin.x + 120, self.boxRect.origin.y + 100, self.smartRect.size.width*0.6, self.smartRect.size.height*0.6);
    }
    return self.smartRect;
}

- (CGRect)moneyLocInBoardView:(BoardView *)sender
{
    if (self.moneyIsInsideBox) {
        return CGRectMake(self.boxRect.origin.x + 260, self.boxRect.origin.y + 120, self.moneyRect.size.width*0.6, self.moneyRect.size.height*0.6);
    }
    return self.moneyRect;
}

- (CGRect)boxLocInBoardView:(BoardView *)sender
{
    return self.boxRect;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
