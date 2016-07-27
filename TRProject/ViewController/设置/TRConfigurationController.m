//
//  TRConfigurationController.m
//  TRProject
//
//  Created by spare on 16/7/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRConfigurationController.h"
#import "TRConfigurationTwoController.h"
#import "TRcollectViewController.h"
@interface TRConfigurationController ()
//显示缓存的lable
@property (weak, nonatomic) IBOutlet UILabel *textLb;

@end

@implementation TRConfigurationController




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
//            UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//            TRConfigurationTwoController *configurationTwoVC = [mainSb instantiateViewControllerWithIdentifier:@"TRConfigurationTwoController"];
//            //UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:configurationTwoVC];
//            [self.navigationController pushViewController:configurationTwoVC animated:YES];
//            TRcollectViewController *collectionVC = [[TRcollectViewController alloc]initWithStyle:UITableViewStylePlain];
//            [self.navigationController pushViewController:collectionVC animated:YES];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.view showWarning:@"暂不支持收藏功能"];
            }];
            
             }
        
       
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 1) {
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"缓存清除" message:@"确定清除缓存?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
                alertView.delegate = self;
                [alertView show];
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                [self.view showWarning:@"举报成功"];
            }];
        }
    }
}

//计算缓存大小
- (NSString *)getCacheSize
{
    long long sumSize = 0;
    NSString *cacheFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSArray *subPaths = [filemanager subpathsOfDirectoryAtPath:cacheFilePath error:nil];
    for (NSString *subPath in subPaths) {
        NSString *filePath = [cacheFilePath stringByAppendingPathComponent:subPath];
        long long fileSize = [[filemanager attributesOfItemAtPath:filePath error:nil]fileSize];
        sumSize += fileSize;
    }
    float size_m = sumSize/(1000*1000);
    return [NSString stringWithFormat:@"%.2fM",size_m];
}



- (void)returnClicked{
     [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    UIBarButtonItem *lefeItem = [[UIBarButtonItem alloc]initWithTitle:@"分类" style:UIBarButtonItemStyleDone target:self action:@selector(returnClicked)];
    lefeItem.tintColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = lefeItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [[NSOperationQueue new]addOperationWithBlock:^{
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSString *cacheFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
            [fileManager removeItemAtPath:cacheFilePath error:nil];
            _textLb.text = [self getCacheSize];
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                [self.tableView reloadData];
                [self.view showWarning:@"完成清除"];
            }];
        }];
    }
}
#pragma mark - 页面跳转
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        _textLb.text = [self getCacheSize];
        [self.tableView reloadData];
    }];
    
}

#pragma mark - Table view data source



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
