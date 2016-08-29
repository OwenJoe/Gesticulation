

//
//  FiveViewController.m
//  手势
//
//  Created by imac on 16/8/26.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "FiveViewController.h"

@interface FiveViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) UIImageView *imgView;

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"旋转手势";
    
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(80, 100, 160, 160)];
    [self.imgView setImage:[UIImage imageNamed:@"img"]];
    [self.view addSubview:self.imgView];
    
    //图片允许交互,别忘记设置,否则手势没有反应
    [self.imgView setUserInteractionEnabled:YES];
    
    
    //初始化一个旋转手势
    UIRotationGestureRecognizer *rotationGest = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationView:)];
    [self.imgView addGestureRecognizer:rotationGest];
}

-(void)rotationView:(UIRotationGestureRecognizer *)rotationGest{

    //旋转角度.也是一个累加过程
    NSLog(@"%f",rotationGest.rotation);
    
    //设置图片旋转
    self.imgView.transform = CGAffineTransformRotate(self.imgView.transform, rotationGest.rotation);

    //清除旋转角度累计
    rotationGest.rotation = 0;
}

@end
