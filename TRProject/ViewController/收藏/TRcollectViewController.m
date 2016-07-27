//
//  TRcollectViewController.m
//  TRProject
//
//  Created by spare on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRcollectViewController.h"
#import <CoreData/CoreData.h>
#import "DuanZi.h"
#import "TRDuanZiiViewCell.h"
@interface TRcollectViewController ()<NSFetchedResultsControllerDelegate>
/** <#属性描述#> */
@property (nonatomic) NSFetchedResultsController *fetchedResultsController;
/** <#属性描述#> */
@property (nonatomic) DuanZi *duan;
/** <#属性描述#> */
@property (nonatomic) NSManagedObjectContext *context;
/** <#属性描述#> */
@property (nonatomic) NSArray<DuanZi *> *duanziList;
@end

@implementation TRcollectViewController
- (DuanZi *)duan{
    if (_duan) {
        _duan = [DuanZi new];
    }
    return _duan;
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
    NSFetchRequest* request = [[NSFetchRequest alloc]initWithEntityName:@"DuanZi"];
    
   _duanziList = [_context executeFetchRequest:request error:nil];

   
        
                
}
- (instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        [self createDatabase];
        [self.tableView reloadData];
    }
    return self;
}
- (void)returnClicked{
    [self dismissViewControllerAnimated:YES completion:nil];
    //[self.navigationController popViewControllerAnimated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(returnClicked)];
    leftItem.tintColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = leftItem;
    [self createDatabase];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
    [self.tableView.mj_header beginRefreshing];
    [self.tableView reloadData];
    [self.tableView registerClass:[TRDuanZiiViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    return [tableView fd_heightForCellWithIdentifier:@"Cell" configuration:^(TRDuanZiiViewCell *cell) {
//        
//        cell.timeLb.text = _duanziList[indexPath.row].time;
//        cell.titleLb.text = _duanziList[indexPath.row].counts;
//        cell.iconImageL.image = [UIImage imageNamed:@"digupicon_comment_night"];
//        cell.iconImageR.image = [UIImage imageNamed:@"essenceicon_dock_night"];
////        cell.iconImageL.image = [UIImage imageNamed:_duanziList[indexPath.row].leftImage];
////        cell.iconImageR.image = [UIImage imageNamed:_duanziList[indexPath.row].rightImage];
//        cell.countLb.text = _duanziList[indexPath.row].number;
//    }];
    return 200;
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return _duanziList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TRDuanZiiViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.timeLb.text = _duanziList[indexPath.row].time;
    cell.titleLb.text = _duanziList[indexPath.row].counts;
    cell.iconImageL.image = [UIImage imageNamed:@"digupicon_comment_night"];
    cell.iconImageR.image = [UIImage imageNamed:@"essenceicon_dock_press"];
    //cell.iconImageL.image = [UIImage imageNamed:_duanziList[indexPath.row].leftImage];
    //cell.iconImageR.image = [UIImage imageNamed:_duanziList[indexPath.row].rightImage];
    cell.countLb.text = _duanziList[indexPath.row].number;
//    [cell.controlR addTarget:self action:@selector(clickedControl) forControlEvents:UIControlEventTouchUpInside]
   
    
    return cell;
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
