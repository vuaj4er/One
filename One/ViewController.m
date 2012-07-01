//
//  ViewController.m
//  One
//
//  Created by Lion User on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "BoardView.h"

@interface ViewController () <BoardViewDataSource>

//@property (nonatomic, weak) UIImage *smartImage;
@property (nonatomic, weak) IBOutlet BoardView *boardView;

@property (nonatomic) CGRect setRect;
@property (nonatomic) CGRect smartRect;

@end

@implementation ViewController

//@synthesize smartImage = _smartImage;
@synthesize boardView = _boardView;

@synthesize setRect = _setRect;
@synthesize smartRect = _smartRect;

- (void)setBoardView:(BoardView *)boardView
{
    _boardView = boardView;
    self.setRect = CGRectMake(30, 520, 3008*0.2, 2000*0.2);
    self.smartRect = CGRectMake(20, 30, 386*0.8, 313*0.8);
    
    NSLog(@"set Rects");
    
    //[self.boardView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self.boardView action:@selector(pan:)]];
    [self.boardView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)]];
    self.boardView.dataSource = self;
}

-(void)setSmartRect:(CGRect)smartRect
{
    //if (_smartRect != smartRect) {
    _smartRect = smartRect;
    [self.boardView setNeedsDisplay];
    //}
}

-(void)setSetRect:(CGRect)setRect
{
    _setRect = setRect;
    [self.boardView setNeedsDisplay];
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
    NSLog(@"get smartLoc");
    return self.smartRect;
}

- (CGRect)setLocInBoardView:(BoardView *)sender
{
    return self.setRect;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
