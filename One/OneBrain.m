//
//  OneBrain.m
//  One
//
//  Created by Lion User on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OneBrain.h"

@implementation OneBrain

- (BOOL)ifPoint:(CGPoint)p insideRect:(CGRect)rect
{
    if ((p.x <= rect.origin.x + rect.size.width) && (p.x >= rect.origin.x) &&
        (p.y <= rect.origin.y + rect.size.height) && (p.y >= rect.origin.y)) {
        return YES;
    }
    return NO;
}

- (BOOL)ifStuff:(CGRect)stuffRect insideBox:(CGRect)boxRect
{
    BOOL yesNo = YES;

    yesNo &= [self ifPoint:stuffRect.origin insideRect:boxRect];
    yesNo &= [self ifPoint:CGPointMake(stuffRect.origin.x + stuffRect.size.width, stuffRect.origin.y) insideRect:boxRect];
    yesNo &= [self ifPoint:CGPointMake(stuffRect.origin.x, stuffRect.origin.y + stuffRect.size.height) insideRect:boxRect];
    yesNo &= [self ifPoint:CGPointMake(stuffRect.origin.x + stuffRect.size.width, stuffRect.origin.y + stuffRect.size.height) insideRect:boxRect];
    
    return yesNo;
}

@end
