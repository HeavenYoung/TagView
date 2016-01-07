//
//  TagLableView.m
//  TagView
//
//  Created by Heaven on 15/12/10.
//  Copyright © 2015年 Heaven. All rights reserved.
//

#import "TagLableView.h"
#import "UIView+Extension.h"
@interface TagLableView ()
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *currentLable;
@end

@implementation TagLableView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title titleFont:(UIFont *)titleFont tagArray:(NSArray *)tagArray {
    if (self = [super initWithFrame:frame]) {
        
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(12, 12, 0, 0)];
        titleLable.font = titleFont;
        titleLable.text = title;
        [titleLable sizeToFit];
        [self addSubview:titleLable];
        self.titleLabel = titleLable;

        [self setupLableWithTagArray:tagArray];
    }
    return self;
}

- (void)setupLableWithTagArray:(NSArray *)tagArray {

    NSInteger count = tagArray.count;
    for (int i = 0; i < count; i++) {
        
        NSString *string = tagArray[i];
        
        UILabel *lable = [[UILabel alloc] init];
        lable.userInteractionEnabled = YES;
        lable.backgroundColor = [UIColor blueColor];
        lable.textColor = [UIColor whiteColor];
        lable.textAlignment = NSTextAlignmentCenter;
        lable.font = [UIFont systemFontOfSize:14];
        lable.text = string;
        [lable sizeToFit];
        lable.layer.cornerRadius = 15;
        lable.layer.masksToBounds = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tagLabelDidClicked:)];
        [lable addGestureRecognizer:tap];
        
        lable.width = lable.width + 24;
        lable.height = 30;
        
        if (i == 0) {
            lable.x = self.titleLabel.width + 15;
            lable.y = self.titleLabel.y - 7;
    
            if (lable.x + lable.width > self.width) {
                lable.width = self.width - lable.x;
            }
            self.currentLable = lable;
            
        } else {
            
            lable.x = self.currentLable.x + self.currentLable.width + 15;
            lable.y = self.currentLable.y;
            
            if (lable.x + lable.width > self.width) {
                lable.x = self.titleLabel.width + 15;
                lable.y = self.currentLable.y + 40;
                
                if (lable.x + lable.width > self.width) {
                    lable.width = self.width - lable.x;
                }
                
                self.currentLable = lable;
            }
            self.currentLable = lable;
        }

        [self addSubview:lable];
    }
}

- (void)tagLabelDidClicked:(UITapGestureRecognizer *)tap {
    UILabel *label = (UILabel *)tap.view;
    if ([self.delegate respondsToSelector:@selector(tagDidClicked:)]) {
        [self.delegate tagDidClicked:label];
    }
}

- (CGFloat)getCurrentheight {
    return self.currentLable.y + self.currentLable.height;
}

@end
