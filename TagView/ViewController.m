//
//  ViewController.m
//  TagView
//
//  Created by Heaven on 15/12/10.
//  Copyright © 2015年 Heaven. All rights reserved.
//

#import "ViewController.h"
#import "TagLableView.h"
@interface ViewController () <TagLableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *array = @[@"L·梅西", @"内马尔 JR", @"L·苏亚雷斯", @"A·伊涅斯塔", @"I·拉基蒂奇", @"塞尔吉奥·布斯克茨",@"丹尼·阿尔维斯", @"杰拉德·皮克"];
    TagLableView *labelView = [[TagLableView alloc] initWithFrame:CGRectMake(20, 10, 300, 300) title:@"球员" titleFont:[UIFont systemFontOfSize:14] tagArray:array];
    labelView.delegate = self;
    labelView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:labelView];
    
    CGFloat height = [labelView getCurrentheight];
    labelView.frame = CGRectMake(10, 10, 300, height);
    
}

- (void)tagDidClicked:(UILabel *)sender {
    NSLog(@"%@", sender.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
