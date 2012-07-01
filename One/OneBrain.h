//
//  OneBrain.h
//  One
//
//  Created by Lion User on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OneBrain : NSObject

- (BOOL)ifStuff:(CGRect)stuffRect insideBox:(CGRect)boxRect;
- (BOOL)ifPoint:(CGPoint)p insideRect:(CGRect)rect;

@end
