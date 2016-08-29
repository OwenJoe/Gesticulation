//
//  WBTableViewController.m
//  手势
//
//  Created by imac on 16/8/26.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "WBTableViewController.h"

#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "SixViewController.h"
#import "SevenViewController.h"


@interface WBTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *wbTableView;
@end

@implementation WBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.wbTableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.wbTableView.dataSource =self;
    self.wbTableView.delegate = self;
    [self.view addSubview:self.wbTableView];
    self.title = @"手势集合";
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *iDs= @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iDs];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iDs];
    }
    NSArray *Arry = [NSArray arrayWithObjects:@"敲击手势",@"长按手势",@"轻扫手势",@"捏合手势",@"旋转手势",@"拖拽手势",@"旋转+捏合+拖拽",nil];
    cell.textLabel.text = Arry[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    [self.wbTableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row ==0) {
        
        OneViewController *oneVc = [OneViewController alloc];
        [self.navigationController pushViewController:oneVc animated:YES];
    }
    if (indexPath.row ==1) {
        
        TwoViewController *twoVc = [TwoViewController alloc];
        [self.navigationController pushViewController:twoVc animated:YES];
    }
    if (indexPath.row ==2) {
        
        ThreeViewController *thrVc = [ThreeViewController alloc];
        [self.navigationController pushViewController:thrVc animated:YES];
    }
    if (indexPath.row ==3) {
        
        FourViewController *forVc = [FourViewController alloc];
        [self.navigationController pushViewController:forVc animated:YES];
    }
    if (indexPath.row ==4) {
        
        FiveViewController *fiVc = [FiveViewController alloc];
        [self.navigationController pushViewController:fiVc animated:YES];
    }
    if (indexPath.row ==5) {
        
        SixViewController *sixVc = [SixViewController alloc];
        [self.navigationController pushViewController:sixVc animated:YES];
    }
    if (indexPath.row ==6) {
        
        SevenViewController *seVc = [SevenViewController alloc];
        [self.navigationController pushViewController:seVc animated:YES];
    }
}























@end

