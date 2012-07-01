//
//  ViewController.m
//  One
//
//  Created by Lion User on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIImageView *smartImageView;

@end

@implementation ViewController

@synthesize smartImageView = _smartImageView;

- (void)setSmartImageView:(UIImageView *)smartImageView
{
    _smartImageView = smartImageView;
    [self.smartImageView addGestureRecognizer:[[UIPanGestureRecognizer alloc] init]];
}

- (void)pan:(UIPanGestureRecognizer *)gesture withImageView:(UIImageView *)imageView
{
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        CGPoint panPoint = [gesture translationInView:self.view];
        
    }
}
     
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
