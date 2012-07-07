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

- (CGRect)boxLocInBoardView:(BoardView *)sender;
- (CGRect)smartLocInBoardView:(BoardView *)sender;
- (CGRect)moneyLocInBoardView:(BoardView *)sender;
- (CGRect)bookLocInBoardView:(BoardView *)sender;
- (CGRect)drawLocInBoardView:(BoardView *)sender;

@end

@interface BoardView : UIView

@property (nonatomic, weak) IBOutlet id <BoardViewDataSource> dataSource;

@end
