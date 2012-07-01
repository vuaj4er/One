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

@property (nonatomic) CGRect boxRect;
@property (nonatomic) CGRect smartRect;
@property (nonatomic) BOOL smartIsInsideBox;    //YES: inside, NO: outside


@end

@implementation ViewController

//@synthesize smartImage = _smartImage;
@synthesize boardView = _boardView;
@synthesize oneBrain = _oneBrain;

@synthesize boxRect = _boxRect;
@synthesize smartRect = _smartRect;
@synthesize smartIsInsideBox = _smartIsInsideBox;

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
    //if (_smartRect != smartRect) {
    if ([self.oneBrain ifStuff:smartRect insideBox:self.boxRect]) {
        self.smartIsInsideBox = YES;
    }
    _smartRect = smartRect;
    [self.boardView setNeedsDisplay];
    //}
}

-(void)setBoxRect:(CGRect)boxRect
{
    _boxRect = boxRect;
    [self.boardView setNeedsDisplay];
}

- (void)locSetToDefault
{    
    self.boxRect = CGRectMake(30, 520, 3008*0.2, 2000*0.2);
    self.smartRect = CGRectMake(20, 30, 386*0.8, 313*0.8);
    self.smartIsInsideBox = NO;
}

- (void)pan:(UIPanGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        CGPoint translation = [gesture translationInView:self.boardView];
        self.smartRect = CGRectMake(self.smartRect.origin.x + translation.x, self.smartRect.origin.y + translation.y, self.smartRect.size.width, self.smartRect.size.height);
        [gesture setTranslation:CGPointZero inView:self.boardView];
    }
}

- (CGRect)smartLocInBoardView:(BoardView *)sender
{
    if (self.smartIsInsideBox) {
        return CGRectMake(self.boxRect.origin.x + 120, self.boxRect.origin.y + 100, self.smartRect.size.width*0.6, self.smartRect.size.height*0.6);
    }
    return self.smartRect;
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
