//
//  SixViewController.m
//  手势
//
//  Created by imac on 16/8/26.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "SixViewController.h"

@interface SixViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) UIImageView *imgView;

@end

@implementation SixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"拖拽手势";
    
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 80, 80)];
    [self.imgView setImage:[UIImage imageNamed:@"img"]];
    [self.view addSubview:self.imgView];
    
    //图片允许交互,别忘记设置,否则手势没有反应
    [self.imgView setUserInteractionEnabled:YES];
    
    
    //初始化一个拖拽手势
    UIPanGestureRecognizer *panGest = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panView:)];
    [self.imgView addGestureRecognizer:panGest];
}

-(void)panView:(UIPanGestureRecognizer *)panGest{

    //拖拽的距离(距离是一个累加)
    CGPoint trans = [panGest translationInView:panGest.view];
    NSLog(@"%@",NSStringFromCGPoint(trans));
    
    //设置图片移动
    CGPoint center =  self.imgView.center;
    center.x += trans.x;
    center.y += trans.y;
    self.imgView.center = center;
    
    //清除累加的距离
    [panGest setTranslation:CGPointZero inView:panGest.view];
}
@end
