//
//  TRDuanZiViewController.m
//  TRProject
//
//  Created by spare on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRDuanZiViewController.h"
#import "TRDuanZiViewModel.h"
#import "TRDuanZiiViewCell.h"
#import <CoreData/CoreData.h>
#import "DuanZi.h"
#import "TRcollectViewController.h"
@interface TRDuanZiViewController ()<UITableViewDelegate,UITableViewDataSource>
/** <#属性描述#> */
@property (nonatomic) UITableView *tableView;
/** <#属性描述#> */
@property (nonatomic) TRDuanZiViewModel *duanZiVM;
/** <#属性描述#> */
@property (nonatomic) DuanZi *duan;
/** <#属性描述#> */
@property (nonatomic) NSManagedObjectContext *context;
@end


@implementation TRDuanZiViewController{
    NSTimer *_timer;
}
- (DuanZi *)duan{
    if (!_duan) {
        _duan = [DuanZi new];
    }
    return _duan;
}

- (void)ReturnPage{
    [self.sideMenuViewController presentLeftMenuViewController];
}
- (void)createDatabase{
    //1.创建上下文对象
    _context = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    //2.创建coordinator对象
    //momd：是xcdatamodeld编译之后的文件后缀
    NSURL *dataModelFileURL = [[NSBundle mainBundle]URLForResource:@"Model" withExtension:@"momd"];
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc]initWithContentsOfURL:dataModelFileURL];
    NSPersistentStoreCoordinator *coordinater = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    //3.创建持久化存储对象
    NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *databaseFilePath = [documentsPath stringByAppendingPathComponent:@"test.db"];
    NSURL *url = [NSURL fileURLWithPath:databaseFilePath];
    NSError *error = nil;
    [coordinater addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
    
    //4.绑定剩下三个对象之间的关系（数据模型文件/数据库对象）
    [_context setPersistentStoreCoordinator:coordinater];

    

}
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"段子";
        self.tabBarItem.image = [UIImage imageNamed:@"推荐-默认@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.54283.000.00."];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"推荐-焦点@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.19656.000.00."];
        [[UINavigationBar appearance]setBarTintColor:kRGBColor(238, 93, 80, 1.0)];
        [[UINavigationBar appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:24],NSForegroundColorAttributeName:kRGBColor(254, 209, 41, 1.0)}];
        
    }
    return self;
}

//- (instancetype)initWithStyle:(UITableViewStyle)style{
//    if (self = [super initWithStyle:UITableViewStylePlain]) {
//        
//        
//    }
//    return self;
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[TRDuanZiiViewCell class] forCellReuseIdentifier:@"Cell"];
    [self createDatabase];
    self.navigationItem.title = @"段子";
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"分类" style:UIBarButtonItemStyleDone target:self action:@selector(ReturnPage)];
    leftItem.tintColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.duanZiVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                [self.tableView reloadData];
                [self.tableView.mj_header endRefreshing];
                if (self.duanZiVM.isMore) {
                    [self.tableView.mj_footer resetNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
            
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       [self.duanZiVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
           if (error) {
               NSLog(@"%@",error);
           }else{
               [self.tableView reloadData];
               if (!self.duanZiVM.isMore) {
                   [self.tableView.mj_footer endRefreshingWithNoMoreData];
               }
               [self.tableView.mj_footer endRefreshing];
           }
       }];
    }];
    
    
}
- (TRDuanZiViewModel *)duanZiVM{
    if (!_duanZiVM) {
        _duanZiVM = [TRDuanZiViewModel new];
    }
    return _duanZiVM;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    return self.duanZiVM.rowNumber;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.duanZiVM.rowNumber;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TRDuanZiiViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.timeLb.text = [self.duanZiVM updateTimeForRow:indexPath.section];
    cell.titleLb.text = [self.duanZiVM wbodyForRow:indexPath.section];
    [cell.controlL addTarget:self action:@selector(controlLClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.controlR addTarget:self action:@selector(controlRClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.iconImageL.image = [UIImage imageNamed:@"digupicon_comment_night"];
    cell.iconImageR.image = [UIImage imageNamed:@"essenceicon_dock_night"];
    cell.countLb.text = [self.duanZiVM commentsForRow:indexPath.section];
    [cell.button addTarget:self action:@selector(clickedBtn) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
- (void)clickedBtn{
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        [self.view showWarning:@"举报成功"];
    }];
}
//点赞按钮触发
- (void)controlLClicked:(UIControl *)sender{
    TRDuanZiiViewCell *cell = (TRDuanZiiViewCell *)sender.superview.superview.superview;
   
    if (!cell.isSupport) {
         cell.isSupport = 1;
        cell.iconImageL.image = [UIImage imageNamed:@"digupicon_comment_press"];
        cell.countLb.text = [NSString stringWithFormat:@"%ld",([cell.countLb.text integerValue]+1)];
        cell.iconImageOne.image = [UIImage imageNamed:@"add_one"];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
            [cell.iconImageOne removeFromSuperview];
        } repeats:NO];
    }else{
        [self.view showWarning:@"您已赞过"];
    }
    
    
}
//收藏按钮触发
- (void)controlRClicked:(UIControl *)sender{
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        [self.view showWarning:@"暂不支持收藏功能"];
    }];
/*
    TRDuanZiiViewCell *cell = (TRDuanZiiViewCell *)sender.superview.superview.superview;
    cell.isCollect = !cell.isCollect;
    
    

    if (cell.isCollect) {
        cell.iconImageR.image = [UIImage imageNamed:@"essenceicon_dock_press"];
        //需求1：插入数据
        _duan = [NSEntityDescription insertNewObjectForEntityForName:@"DuanZi" inManagedObjectContext:_context];
        //设置值
        _duan.time = cell.timeLb.text;
        _duan.counts = cell.titleLb.text;
        NSData *data = UIImageJPEGRepresentation(cell.iconImageL.image, 1.0f);
        NSString *encodedImageStr = [data base64EncodedString];
        _duan.leftImage = encodedImageStr;
        _duan.number = cell.countLb.text;
        NSData *data1 = UIImageJPEGRepresentation(cell.iconImageR.image, 1.0f);
        NSString *encodedImageStr1 = [data1 base64EncodedString];
        _duan.rightImage = encodedImageStr1;
        
        //save方法写入数据库
        NSError *err = nil;
        if (![_context save:&err]) {
            NSLog(@"插入数据失败：%@",err);
            return;
        }
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            [self.view showWarning:@"收藏成功"];
        }];
        
    }else{
        cell.iconImageR.image = [UIImage imageNamed:@"essenceicon_dock_night"];
        
        //需求4：删除名字叫Jonny的记录
        NSFetchRequest *thirdRequest = [NSFetchRequest fetchRequestWithEntityName:@"DuanZi"];
        //select *from person where name='Jonny';
        NSPredicate *thirdPredicate = [NSPredicate predicateWithFormat:@"counts=%@",cell.titleLb.text];
        NSError *err = nil;
        thirdRequest.predicate = thirdPredicate;
        NSArray *thirdPersonArr = [_context executeFetchRequest:thirdRequest error:&err];
        
        for (DuanZi *duan in thirdPersonArr) {
            [_context deleteObject:duan];
        }
        //写入数据库（save）
        if (![_context save:&err]) {
            NSLog(@"删除失败：%@",err);
            return;
        }
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            [self.view showWarning:@"已取消收藏"];
        }];

    }
    
   TRcollectViewController *collectVC = [TRcollectViewController new];
    [collectVC.tableView reloadData];
*/
}

//cell自适应高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [tableView fd_heightForCellWithIdentifier:@"Cell" configuration:^(TRDuanZiiViewCell *cell) {
        cell.timeLb.text = [self.duanZiVM updateTimeForRow:indexPath.section];
        cell.titleLb.text = [self.duanZiVM wbodyForRow:indexPath.section];
        [cell.controlL addTarget:self action:@selector(controlLClicked:) forControlEvents:UIControlEventTouchUpInside];
        [cell.controlR addTarget:self action:@selector(controlRClicked:) forControlEvents:UIControlEventTouchUpInside];
        cell.iconImageL.image = [UIImage imageNamed:@"digupicon_comment_night"];
        cell.iconImageR.image = [UIImage imageNamed:@"essenceicon_dock_night"];
        cell.countLb.text = [self.duanZiVM commentsForRow:indexPath.section];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
