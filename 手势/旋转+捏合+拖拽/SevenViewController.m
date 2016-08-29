//
//  SevenViewController.m
//  手势
//
//  Created by imac on 16/8/26.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "SevenViewController.h"

@interface SevenViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) UIImageView *imgView;

@end

@implementation SevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"旋转+捏合+拖拽";
    
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 300, 200)];
    [self.imgView setImage:[UIImage imageNamed:@"img"]];
    [self.view addSubview:self.imgView];
    //图片允许交互,别忘记设置,否则手势没有反应
    [self.imgView setUserInteractionEnabled:YES];
    
    
    //默认情况下,控件只能监听一种手势
    //如果要监听到多个手势,设置代理方法,告知允许多个手势存在
    
    //旋转
    UIRotationGestureRecognizer *rotaitonGest = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationView:)];
    rotaitonGest.delegate =self;
    [self.imgView addGestureRecognizer:rotaitonGest];
    
    //捏合
    UIPinchGestureRecognizer *pinchGest = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchView:)];
    [self.imgView addGestureRecognizer:pinchGest];
    
    //拖拽
    UIPanGestureRecognizer *panGest = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panView:)];
    [self.imgView addGestureRecognizer:panGest];
}

-(void)rotationView:(UIRotationGestureRecognizer *)rotationGest{
    
    //旋转角度
    //旋转的角度也一个累加的过程
    NSLog(@"旋转角度 %f",rotationGest.rotation);
    
    // 设置图片的旋转
    self.imgView.transform = CGAffineTransformRotate(self.imgView.transform, rotationGest.rotation);
    
    // 清除 "旋转角度" 的累
    rotationGest.rotation = 0;
    
}


-(void)pinchView:(UIPinchGestureRecognizer *)pinchGest{
    //设置图片缩放
    
    self.imgView.transform = CGAffineTransformScale(self.imgView.transform, pinchGest.scale, pinchGest.scale);
    
    // 还源
    pinchGest.scale = 1;
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

/**
 *  多个手势同时存在的代理
 */
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    return YES;
}










@end
