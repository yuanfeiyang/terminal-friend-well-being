//
//  TRMotorViewController.m
//  TRProject
//
//  Created by spare on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRMotorViewController.h"

#import "TRMotorViewCell.h"
#import "TRMotorTwoController.h"
@interface TRMotorViewController ()<UITableViewDataSource,UITableViewDelegate>
/** <#属性描述#> */
@property (nonatomic) UITableView *tableView;
/** <#属性描述#> */
@property (nonatomic) TRInforMationViewModel *informationVM;
@end

@implementation TRMotorViewController
- (TRInforMationViewModel *)informationVM{
    if (!_informationVM) {
        _informationVM = [[TRInforMationViewModel alloc]initWithType:_informationType];
    }
    return _informationVM;
}

//- (instancetype)initWithStyle:(UITableViewStyle)style informationType:(InformationType)type{
//    if (self = [super initWithStyle:UITableViewStylePlain]) {
//        _informationType = type;
//    }
//    return self;
//}
- (instancetype)initWithInformationType:(InformationType)type{
    if (self = [super init]) {
        _informationType = type;
    }
    return self;
}


- (void)ReturnPage{
    [self.sideMenuViewController presentLeftMenuViewController];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[TRMotorViewCell class] forCellReuseIdentifier:@"Cell"];
    self.navigationItem.title = @"骑行";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"分类" style:UIBarButtonItemStyleDone target:self action:@selector(ReturnPage)];
    leftItem.tintColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self.informationVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                [self.tableView reloadData];
                [self.tableView.mj_header endRefreshing];
                if (self.informationVM.isMoreMotor) {
                    [self.tableView.mj_footer resetNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.informationVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            
            if (error) {
                NSLog(@"%@",error);
            }else{
                [self.tableView reloadData];
                if (!self.informationVM.isMoreMotor) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
                [self.tableView.mj_footer endRefreshing];
            }
            
        }];
    }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.informationVM.rowNumberMotor;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TRMotorViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconImage setImageURL:[self.informationVM imgLinkForRow:indexPath.row]];
    cell.titleLb.text = [self.informationVM titleMotorForRow:indexPath.row];
    cell.contentLb.text = [self.informationVM contentForRow:indexPath.row];
    cell.timeLb.text = [self.informationVM timeForRow:indexPath.row];
    cell.numberLb.text = [self.informationVM readartsForRow:indexPath.row];
    cell.authorLb.text = [self.informationVM authorForRow:indexPath.row];
    [cell.button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
- (void)clickButton:(UIButton *)sender{
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        [self.view showWarning:@"举报成功"];
    }];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"Cell" configuration:^(TRMotorViewCell *cell) {
        
        [cell.iconImage setImageURL:[self.informationVM imgLinkForRow:indexPath.row]];
        cell.titleLb.text = [self.informationVM titleMotorForRow:indexPath.row];
        cell.contentLb.text = [self.informationVM contentForRow:indexPath.row];
        cell.timeLb.text = [self.informationVM timeForRow:indexPath.row];
        cell.numberLb.text = [self.informationVM readartsForRow:indexPath.row];
        cell.authorLb.text = [self.informationVM authorForRow:indexPath.row];
        
    }];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TRMotorTwoController *motorTwoVC = [TRMotorTwoController new];
    motorTwoVC.webUrl = [self.informationVM urlForRow:indexPath.row];
    motorTwoVC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:motorTwoVC animated:YES];
    
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
