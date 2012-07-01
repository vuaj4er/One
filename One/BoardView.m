//
//  BoardView.m
//  One
//
//  Created by Lion User on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoardView.h"

@interface BoardView()

@property (nonatomic, weak) UIImage *smartImage;

@end

@implementation BoardView

@synthesize smartImage = _smartImage;

- (UIImage *)smartImage
{
    if (!_smartImage) {
        _smartImage = [UIImage imageNamed:@"smart.jpg"];
    }
    return _smartImage;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGPoint p = CGPointMake(20, 30);
        [self.smartImage drawAtPoint:p];
        NSLog(@"initWithFrame");
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGPoint p = CGPointMake(20, 30);
    [self.smartImage drawAtPoint:p];
}


@end
