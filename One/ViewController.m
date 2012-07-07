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
@property (weak, nonatomic) IBOutlet UILabel *oneLabel;

//@property (nonatomic) CGRect currentStuff;
@property (nonatomic) int currentStuff;
@property (nonatomic) CGRect boxRect;
@property (nonatomic) CGRect smartRect;
@property (nonatomic) BOOL smartIsInsideBox;    //YES: inside, NO: outside
@property (nonatomic) CGRect moneyRect;
@property (nonatomic) BOOL moneyIsInsideBox;    //YES: inside, NO: outside
@property (nonatomic) CGRect bookRect;
@property (nonatomic) BOOL bookIsInsideBox;    //YES: inside, NO: outside
@property (nonatomic) CGRect drawRect;
@property (nonatomic) BOOL drawIsInsideBox;    //YES: inside, NO: outside


@end

@implementation ViewController

//@synthesize smartImage = _smartImage;
@synthesize boardView = _boardView;
@synthesize oneBrain = _oneBrain;
@synthesize oneLabel = _oneLabel;

@synthesize currentStuff = _currentStuff;
@synthesize boxRect = _boxRect;
@synthesize smartRect = _smartRect;
@synthesize smartIsInsideBox = _smartIsInsideBox;
@synthesize moneyRect = _moneyRect;
@synthesize moneyIsInsideBox = _moneyIsInsideBox;
@synthesize bookRect = _bookRect;
@synthesize bookIsInsideBox = _bookIsInsideBox;
@synthesize drawRect = _drawRect;
@synthesize drawIsInsideBox = _drawIsInsideBox;

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
            if (self.smartIsInsideBox == NO) {
                self.oneLabel.text = @"將十分聰明";
            }
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
            if (self.moneyIsInsideBox == NO) {
                self.oneLabel.text = @"將通曉經商";
            }
            self.moneyIsInsideBox = YES;
        }
        _moneyRect = moneyRect;
        [self.boardView setNeedsDisplay];
    }
}

-(void)setBookRect:(CGRect)bookRect
{
    if (!CGRectEqualToRect(_bookRect, bookRect)) {
        if ([self.oneBrain ifStuff:bookRect insideBox:self.boxRect]) {
            if (self.bookIsInsideBox == NO) {
                self.oneLabel.text = @"將善於讀書";
            }
            self.bookIsInsideBox = YES;
        }
        _bookRect = bookRect;
        [self.boardView setNeedsDisplay];
    }
}

-(void)setDrawRect:(CGRect)drawRect
{
    if (!CGRectEqualToRect(_drawRect, drawRect)) {
        if ([self.oneBrain ifStuff:drawRect insideBox:self.boxRect]) {
            if (self.drawIsInsideBox == NO) {
                self.oneLabel.text = @"將精於藝術";
            }
            self.drawIsInsideBox = YES;
        }
        _drawRect = drawRect;
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
    self.smartRect = CGRectMake(20, 40, 386*0.8, 290*0.8);
    self.smartIsInsideBox = NO;
    self.moneyRect = CGRectMake(self.smartRect.origin.x + self.smartRect.size.width, self.smartRect.origin.y, 925*0.3, 518*0.3);
    self.moneyIsInsideBox = NO;     
    self.bookRect = CGRectMake(self.smartRect.origin.x, self.smartRect.origin.y + self.smartRect.size.height, 823*0.3, 711*0.3);
    self.bookIsInsideBox = NO;
    self.drawRect = CGRectMake(self.smartRect.origin.x + self.smartRect.size.width, self.smartRect.origin.y + self.smartRect.size.height, 485*0.7, 203*0.7);
    self.drawIsInsideBox = NO;
    if (self.boardView.bounds.size.width > self.boardView.bounds.size.height) { // rotate
        int len = MIN(MIN(self.smartRect.size.width, self.moneyRect.size.width), MIN(self.bookRect.size.width, self.drawRect.size.width));
        self.boxRect = CGRectMake(30, self.boardView.bounds.size.height - self.boxRect.size.height - 20, self.boxRect.size.width, self.boxRect.size.height);
        self.bookRect = CGRectMake(self.smartRect.origin.x + 2*len, self.smartRect.origin.y, self.bookRect.size.width, self.bookRect.size.height);
        self.drawRect = CGRectMake(self.smartRect.origin.x + 3*len, self.smartRect.origin.y, self.drawRect.size.width, self.drawRect.size.height);
    }
    self.oneLabel.text = @"";
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
        else if (self.currentStuff == 3) {
            self.bookRect = CGRectMake(self.bookRect.origin.x + translation.x, self.bookRect.origin.y + translation.y, self.bookRect.size.width, self.bookRect.size.height);
        }
        else if (self.currentStuff == 4) {
            self.drawRect = CGRectMake(self.drawRect.origin.x + translation.x, self.drawRect.origin.y + translation.y, self.drawRect.size.width, self.drawRect.size.height);
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
        else if ([self.oneBrain ifPoint:p insideRect:self.bookRect]) {
            self.currentStuff = 3;
        }
        else if ([self.oneBrain ifPoint:p insideRect:self.drawRect]) {
            self.currentStuff = 4;
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

- (CGRect)bookLocInBoardView:(BoardView *)sender
{
    if (self.bookIsInsideBox) {
        return CGRectMake(self.boxRect.origin.x + 300, self.boxRect.origin.y + 200, self.bookRect.size.width*0.6, self.bookRect.size.height*0.6);
    }
    return self.bookRect;
}

- (CGRect)drawLocInBoardView:(BoardView *)sender
{
    if (self.drawIsInsideBox) {
        return CGRectMake(self.boxRect.origin.x + 200, self.boxRect.origin.y + 180, self.drawRect.size.width*0.6, self.drawRect.size.height*0.6);
    }
    return self.drawRect;
}

- (CGRect)boxLocInBoardView:(BoardView *)sender
{
    return self.boxRect;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //NSLog(@"autorotate");
    return YES;
}

- (void)viewDidUnload {
    [self setOneLabel:nil];
    [super viewDidUnload];
}
@end
