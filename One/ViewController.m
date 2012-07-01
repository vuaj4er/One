//
//  ViewController.m
//  One
//
//  Created by Lion User on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "BoardView.h"

@interface ViewController ()

//@property (nonatomic, weak) UIImage *smartImage;
@property (nonatomic, weak) IBOutlet BoardView *boardView;

@end

@implementation ViewController

//@synthesize smartImage = _smartImage;
@synthesize boardView = _boardView;
     
- (void)setBoardView:(BoardView *)boardView
{
    _boardView = boardView;
    [self.boardView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self.boardView
                                                                                 action:@selector(pan:)]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
