//
//  ThreeViewController.m
//  手势
//
//  Created by imac on 16/8/26.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) UIImageView *imgView;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"轻扫手势";
    
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 300, 200)];
    [self.imgView setImage:[UIImage imageNamed:@"img"]];
    [self.view addSubview:self.imgView];
    
    //图片允许交互,别忘记设置,否则手势没有反应
    [self.imgView setUserInteractionEnabled:YES];

    
    //手势有四个方向,根据需要选择
    //UISwipeGestureRecognizerDirectionRight 向右轻扫
    //UISwipeGestureRecognizerDirectionLeft    向左轻扫
    //UISwipeGestureRecognizerDirectionUp    向上
    //UISwipeGestureRecognizerDirectionDown 向下
    
    //初始化一个轻扫手势
    UISwipeGestureRecognizer *swipeGest = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView:)];
    [self.imgView addGestureRecognizer:swipeGest];
}

-(void)swipeView:(UISwipeGestureRecognizer *)swipeGest{

    NSLog(@"手势状态:%ld",swipeGest.state);
    
    //如何判断开始和跟结束
}

@end
