//
//  TRVideoViewController.m
//  TRProject
//
//  Created by spare on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRVideoViewController.h"
#import "TRVideoTableCell.h"
#import "TRVideoViewModel.h"
#import "VideoPlayViewController.h"
#import "ZXVideo.h"
@import AVFoundation;
@import AVKit;

@interface TRVideoViewController ()<UITableViewDelegate,UITableViewDataSource>
/** <#属性描述#> */
@property (nonatomic) TRVideoViewModel *videoVM;
/** <#属性描述#> */
@property (nonatomic) UITableView *tableView;
@end

@implementation TRVideoViewController
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"发现-默认@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.53246.000.00."];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"发现-焦点@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.18619.000.00."];
        
    }
    return self;
}

- (TRVideoViewModel *)videoVM{
    if (!_videoVM) {
        _videoVM = [TRVideoViewModel new];
    }
    return _videoVM;
}
- (void)ReturnPage{
    [self.sideMenuViewController presentLeftMenuViewController];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = kRGBColor(43, 171, 218, 1.0);
    self.navigationItem.title = @"视频";
    //self.tableView.delaysContentTouches = NO;
    [self.tableView registerClass:[TRVideoTableCell class] forCellReuseIdentifier:@"Cell"];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"分类" style:UIBarButtonItemStyleDone target:self action:@selector(ReturnPage)];
    leftItem.tintColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.videoVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                [self.tableView reloadData];
                [self.tableView.mj_header endRefreshing];
                if (self.videoVM.isMore) {
                    [self.tableView.mj_footer resetNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
            
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.videoVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                [self.tableView reloadData];
                if (!self.videoVM.isMore) {
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [tableView fd_heightForCellWithIdentifier:@"Cell" configuration:^(TRVideoTableCell *cell) {
        
        [cell.iconImage setImageURL:[self.videoVM iconImageForRow:indexPath.section]];
        cell.countLb.text = [self.videoVM countsForRow:indexPath.section];
        cell.imageCount.image = [UIImage imageNamed:@"head_night"];
        cell.timeLb.text = [self.videoVM updateTimeForRow:indexPath.section];
        cell.centerImage.image = [UIImage imageNamed:@"PlayButtonOverlayLarge"];
        cell.titleLb.text = [self.videoVM wbodyForRow:indexPath.section];
    }];
            
}



//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    return self.videoVM.rowNumber;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.videoVM.rowNumber;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TRVideoTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell.iconImage setImageURL:[self.videoVM iconImageForRow:indexPath.section]];
    cell.imageCount.image = [UIImage imageNamed:@"head_night"];
    cell.timeLb.text = [self.videoVM updateTimeForRow:indexPath.section];
    cell.centerImage.image = [UIImage imageNamed:@"playbutton_video_textpage_press"];
    cell.titleLb.text = [self.videoVM wbodyForRow:indexPath.section];
    cell.countLb.text = [self.videoVM countsForRow:indexPath.section];
    [cell.control addTarget:self action:@selector(controlClicked:) forControlEvents:UIControlEventTouchUpInside];
    cell.control.tag = indexPath.section;
    [cell.button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)clickButton:(UIButton *)sender{
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        [self.view showWarning:@"举报成功"];
    }];
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
//    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc]init];
//    playerVC.player = [AVPlayer playerWithURL:[self.videoVM videoForRow:indexPath.row]];
//    //[self.navigationController pushViewController:playerVC animated:YES];
//    [self.navigationController presentViewController:playerVC animated:YES completion:nil];
//    [playerVC.player play];
//}
- (void)controlClicked:(UIControl *)sender{
//    NSIndexPath *indexPath = [self.tableView indexPathForCell:(TRVideoTableCell *)sender.superview.superview.superview];
//    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
//    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc]init];
//    playerVC.player = [AVPlayer playerWithURL:[self.videoVM videoForRow:sender.tag]];
//    [self.navigationController pushViewController:playerVC animated:YES];
//    [playerVC.player play];
    NSURL *videoURL = [self.videoVM videoForRow:sender.tag];
    ZXVideo *video = [[ZXVideo alloc] init];
    video.playUrl = videoURL.absoluteString;
    video.title = @"视频";
    
    VideoPlayViewController *vc = [[VideoPlayViewController alloc] init];
    vc.video = video;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];

    
    
    
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
