

//
//  FourViewController.m
//  手势
//
//  Created by imac on 16/8/26.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) UIImageView *imgView;

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"捏合手势";
    
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 300, 200)];
    [self.imgView setImage:[UIImage imageNamed:@"img"]];
    
    //图片允许交互,别忘记设置,否则手势没有反应
    [self.imgView setUserInteractionEnabled:YES];

    
    UIPinchGestureRecognizer *pinTap = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinView:)];
    [self.imgView addGestureRecognizer:pinTap];
    
    [self.view addSubview:self.imgView];
}


-(void)pinView:(UIPinchGestureRecognizer *)pinGest{

    //缩放的比例是一个"累加"过程
    NSLog(@"%s----%f",__func__,pinGest.scale);
    
#warning 放大图片后， 再次缩放的时候，马上回到原先的大小
    //self.imageView.transform = CGAffineTransformMakeScale(pinGest.scale, pinGest.scale);
    
    
    self.imgView.transform = CGAffineTransformScale(self.imgView.transform, pinGest.scale, pinGest.scale);
    
    // 让比例还原，不要累加
    // 解决办法，重新设置scale
    pinGest.scale = 1;
}

@end
