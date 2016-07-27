//
//  ViewController.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "TRcollectViewController.h"
#import "TRConfigurationController.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) UITableView *tableView;
@end

@implementation ViewController

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 30;
    }
    return 0;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //选择音频列表 -> 0
    //选择录音 -> 1
    //获取当前视图控制器所在的侧边栏控制器的内容的控制器
    if (indexPath.section == 0) {
        
        UITabBarController *tabC = (UITabBarController *)self.sideMenuViewController.contentViewController;
        tabC.selectedIndex = indexPath.row;
        [self.sideMenuViewController hideMenuViewController];

    }
    
    if (indexPath.section == 1) {
//        if (indexPath.row == 0) {
//            
//            TRcollectViewController *collectVC = [[TRcollectViewController alloc]initWithStyle:UITableViewStylePlain];
//            UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:collectVC];
//            [self presentViewController:navc animated:YES completion:nil];
//            
//        }
        if (indexPath.row == 0) {
            UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            TRConfigurationController *configurationVC = [mainSb instantiateViewControllerWithIdentifier:@"TRConfigurationController"];
            UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:configurationVC];
            [self presentViewController:navc animated:YES completion:nil];
            
            
        }
       
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.textLabel.text = @[@"段子",@"美文",@"视频",@"资讯"][indexPath.row];
        
    }
    if (indexPath.section == 1) {
        cell.textLabel.text = @[@"设置"][indexPath.row];
    }
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        cell.backgroundColor = kRGBColor(136, 55, 138, 1.0);
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.backgroundColor = kRGBColor(243, 62, 67, 1.0);
        }
      
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    //self.view.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectNull style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.backgroundColor = [UIColor greenColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.scrollEnabled = NO;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.edges.equalTo(UIEdgeInsetsMake(100, 0, 390,0));
            make.left.right.equalTo(0);
            make.top.equalTo(100);
            make.bottom.equalTo(0);
        }];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}

@end
