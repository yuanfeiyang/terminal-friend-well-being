//
//  TRPageViewController.m
//  TRProject
//
//  Created by spare on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRPageViewController.h"
#import "TRMotorViewController.h"
#import "TRMilitaryViewController.h"

@interface TRPageViewController ()

@end

@implementation TRPageViewController
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"资讯";
        self.tabBarItem.image = [UIImage imageNamed:@"栏目-默认@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.45456.000.00."];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"栏目-焦点@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.10829.000.00."];
    }
    return self;
}


- (NSArray<NSString *> *)titles{
    return @[@"骑行",@"军事"];
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    return self.titles[index];
   
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    if (index == 0) {
//        TRMotorViewController *vc = [[TRMotorViewController alloc]initWithStyle:UITableViewStylePlain informationType:index];
        TRMotorViewController *vc = [[TRMotorViewController alloc]initWithInformationType:index];
        return vc;
    }else{
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(kScreenW, kScreenW*400/700);
        TRMilitaryViewController *militaryVc = [[TRMilitaryViewController alloc]initWithCollectionViewLayout:layout informationType:index];
        return militaryVc;
    }
    return nil;
    
}

- (void)ReturnPage{
    [self.sideMenuViewController presentLeftMenuViewController];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *lefeItem = [[UIBarButtonItem alloc]initWithTitle:@"分类" style:UIBarButtonItemStyleDone target:self action:@selector(ReturnPage)];
    lefeItem.tintColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = lefeItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
