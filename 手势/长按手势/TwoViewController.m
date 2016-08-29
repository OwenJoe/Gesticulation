//
//  TwoViewController.m
//  手势
//
//  Created by imac on 16/8/26.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) UIImageView *imgView;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"长按手势";
    
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 80, 80)];
    [self.imgView setImage:[UIImage imageNamed:@"img"]];
    [self.view addSubview:self.imgView];
    
    //图片允许交互,别忘记设置,否则手势没有反应
    [self.imgView setUserInteractionEnabled:YES];
    
    //初始化一个长按手势
    UILongPressGestureRecognizer *longPressGest = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressView:)];
    
    //长按等待时间
    longPressGest.minimumPressDuration = 3;
    
    //长按时候,手指头可以移动的距离
    longPressGest.allowableMovement = 30;
    [self.imgView addGestureRecognizer:longPressGest];
}


-(void)longPressView:(UILongPressGestureRecognizer *)longPressGest{

    NSLog(@"%ld",longPressGest.state);
    if (longPressGest.state==UIGestureRecognizerStateBegan) {
       
        NSLog(@"长按手势开启");
    } else {
        NSLog(@"长按手势结束");
    }
    
}
@end
