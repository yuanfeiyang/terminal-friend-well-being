//
//  AppDelegate.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "TRIntentionNetManager.h"
#import "TRDuanZiViewController.h"
#import "TRMeiNvViewController.h"
#import "TRVideoViewController.h"
#import "TRMotorViewController.h"
#import "ViewController.h"
#import "TRcollectViewController.h"
#import "TRMilitaryViewController.h"

#import "TRArticleViewController.h"

#import "TRPageViewController.h"
@interface AppDelegate ()
/** <#属性描述#> */
@property (nonatomic) UITabBarController *tabBar;
/** <#属性描述#> */
@property (nonatomic) UINavigationController *navcD;
/** <#属性描述#> */
@property (nonatomic) UINavigationController *navcM;
/** <#属性描述#> */
@property (nonatomic) UINavigationController *navcV;

/** <#属性描述#> */
@property (nonatomic) UINavigationController *navcCollect;
/** <#属性描述#> */
@property (nonatomic) UINavigationController *navcMilitary;
/** <#属性描述#> */
@property (nonatomic) TRVideoViewController *videoVC;
/** <#属性描述#> */
@property (nonatomic) TRDuanZiViewController *duanZiVC;
/** <#属性描述#> */
@property (nonatomic) TRMeiNvViewController *meiNvVC;
/** <#属性描述#> */
@property (nonatomic) TRcollectViewController *collectVC;
/** <#属性描述#> */
@property (nonatomic) TRPageViewController *pageVC;
/** <#属性描述#> */
@property (nonatomic) RESideMenu *sideMenu;
/** <#属性描述#> */
@property (nonatomic) ViewController *viewVC;

@property (nonatomic) TRArticleViewController *articleVC;
@end

@implementation AppDelegate
#pragma mark - LifeCycle 生命周期
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self window];
    //全局默认配置
    [self setupGlobalConfig];
    return YES;
}
#pragma mark - LazyLoad 懒加载
- (TRDuanZiViewController *)duanZiVC{
    if (!_duanZiVC) {
        _duanZiVC = [TRDuanZiViewController new];
    }
    return _duanZiVC;
}
- (TRMeiNvViewController *)meiNvVC{
    if (!_meiNvVC) {
       // UICollectionViewFlowLayout *flowlayout = [UICollectionViewFlowLayout new];
        _meiNvVC = [[TRMeiNvViewController alloc]init];
    }
    return _meiNvVC;
}
- (TRArticleViewController *)articleVC{
    if (!_articleVC) {
        _articleVC = [[TRArticleViewController alloc]init];
    }
    return _articleVC;
}
- (TRVideoViewController *)videoVC{
    if (!_videoVC) {
        _videoVC = [[TRVideoViewController alloc]init];
    }
    return _videoVC;
}

- (TRcollectViewController *)collectVC{
    if (!_collectVC) {
        _collectVC = [TRcollectViewController new];
    }
    return _collectVC;
}


- (TRPageViewController *)pageVC{
    if (!_pageVC) {
        _pageVC = [TRPageViewController new];
        _pageVC.showOnNavigationBar = YES;
        _pageVC.menuViewStyle = WMMenuViewStyleLine;
        _pageVC.menuBGColor = [UIColor clearColor];
    }
    return _pageVC;
}

- (UINavigationController *)navcMilitary{
    if (!_navcMilitary) {
        _navcMilitary = [[UINavigationController alloc]initWithRootViewController:self.pageVC];
       // _navcMilitary.navigationBar.translucent = NO;
    }
    return _navcMilitary;
}
- (UINavigationController *)navcCollect{
    if (!_navcCollect) {
        _navcCollect = [[UINavigationController alloc]initWithRootViewController:self.collectVC];
       // _navcCollect.navigationBar.translucent = NO;
    }
    return _navcCollect;
}

- (UINavigationController *)navcV{
    if (!_navcV) {
        _navcV = [[UINavigationController alloc]initWithRootViewController:self.videoVC];
        //_navcV.navigationBar.translucent = NO;
    }
    return _navcV;
}
- (UINavigationController *)navcD{
    if (!_navcD) {
        _navcD = [[UINavigationController alloc]initWithRootViewController:self.duanZiVC];
        //_navcD.navigationBar.translucent = NO;
    }
    return _navcD;
}
- (UINavigationController *)navcM{
    if (!_navcM) {
        _navcM = [[UINavigationController alloc]initWithRootViewController:self.articleVC];
        _navcM.navigationBar.translucent = NO;
    }
    return _navcM;
}
- (UITabBarController *)tabBar{
    if (!_tabBar) {
        _tabBar = [UITabBarController new];
        _tabBar.viewControllers = @[self.navcD,self.navcM,self.navcV,self.navcMilitary];
        //_tabBar.tabBar.translucent = NO;
    }
    return _tabBar;
}
- (UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
        _window.backgroundColor = [UIColor whiteColor];
        _window.rootViewController = self.sideMenu;
    }
    return _window;
}
- (ViewController *)viewVC{
    if (!_viewVC) {
            _viewVC = [ViewController new];
            //_viewVC.view.backgroundColor = [UIColor redColor];
       }
    return _viewVC;
}
    

- (RESideMenu *)sideMenu{
    if (!_sideMenu) {
        _sideMenu = [[RESideMenu alloc]initWithContentViewController:self.tabBar leftMenuViewController:self.viewVC rightMenuViewController:nil];
        _sideMenu.backgroundImage = [UIImage imageNamed:@"u=2307495126,1863203201&fm=21&gp=0"];
        _sideMenu.scaleContentView = NO;
        _sideMenu.scaleMenuView = NO;
        _sideMenu.bouncesHorizontally = YES;
        CGFloat offset = [UIScreen mainScreen].bounds.size.width/2-200;
        _sideMenu.contentViewInPortraitOffsetCenterX = offset;
    }
    return _sideMenu;
}


@end
