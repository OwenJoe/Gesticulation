//
//  OneViewController.m
//  手势
//
//  Created by imac on 16/8/26.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) UIImageView *imgView;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"敲击手势";
    
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 300, 200)];
    [self.imgView setImage:[UIImage imageNamed:@"img"]];
    [self.view addSubview:self.imgView];
    
    //图片允许交互,别忘记设置,否则手势没有反应
    [self.imgView setUserInteractionEnabled:YES];
    
    //1.创建一个"敲击手势"对象
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc]init];
    
    //2.设置敲击次数
    tapGest.numberOfTapsRequired = 1;
    
    //3.手指头数量,默认不写
//    tapGest.numberOfTouchesRequired = 2;
    
    //4.代理
    tapGest.delegate =self;
    
    //5.手势添加到View
    [self.imgView addGestureRecognizer:tapGest];
    
    //6.手势监听方法
    [tapGest addTarget:self action:@selector(tapGestMethod:)];
}


/**
 *  监听方法
 */
-(void)tapGestMethod:(UITapGestureRecognizer *)tapGest{

    NSLog(@"可以点击了:%s",__func__);
}

/**
 *  手势代理 (实现view只能左边点击,右边无效)
 */
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{

    CGPoint location = [touch locationInView:touch.view];
    if (location.x<= touch.view.bounds.size.width/2) {
        
        return YES;
    }
    return NO;
}
































@end
