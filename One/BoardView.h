//
//  BoardView.h
//  One
//
//  Created by Lion User on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BoardView;

@protocol BoardViewDataSource <NSObject>

- (CGRect)smartLocInBoardView:(BoardView *)sender;
- (CGRect)boxLocInBoardView:(BoardView *)sender;

@end

@interface BoardView : UIView

@property (nonatomic, weak) IBOutlet id <BoardViewDataSource> dataSource;

@end
