//
//  TagLableView.h
//  TagView
//
//  Created by Heaven on 15/12/10.
//  Copyright © 2015年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TagLableViewDelegate <NSObject>
- (void)tagDidClicked:(UILabel *)sender;
@end

@interface TagLableView : UIView

@property (nonatomic, weak) id <TagLableViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title titleFont:(UIFont *)font tagArray:(NSArray *)tagArray;

- (CGFloat)getCurrentheight;

@end
