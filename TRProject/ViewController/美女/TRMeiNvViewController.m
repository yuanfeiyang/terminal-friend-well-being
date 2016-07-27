//
//  TRMeiNvViewController.m
//  TRProject
//
//  Created by spare on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRMeiNvViewController.h"
#import "TRMeiNvViewModel.h"
#import "TRMeiNvViewCell.h"
#import "TRMeiNvLayout.h"
@interface TRMeiNvViewController ()
/** <#属性描述#> */
@property (nonatomic) TRMeiNvViewModel *meiNvVC;
@end

@implementation TRMeiNvViewController{
    UIView *background;
}



static NSString * const reuseIdentifier = @"Cell";

- (TRMeiNvViewModel *)meiNvVC{
    if (!_meiNvVC) {
        _meiNvVC = [TRMeiNvViewModel new];
    }
    return  _meiNvVC;
}
- (instancetype)init{
    TRMeiNvLayout *layout = [TRMeiNvLayout new];
    layout.standardCellHeight = 100.0;
    layout.featureCellHeight = 280.0;
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
         self.title = @"美女";
        self.tabBarItem.image = [UIImage imageNamed:@"recomicon_dock_press_night"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"recomicon_dock_press"];
    }
    return self;
}
- (void)ReturnPage{
    [self.sideMenuViewController presentLeftMenuViewController];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"美女";
    self.tabBarItem.title = @"美女";
    [self.collectionView registerClass:[TRMeiNvViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"分类" style:UIBarButtonItemStyleDone target:self action:@selector(ReturnPage)];
    leftItem.tintColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.meiNvVC getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                [self.collectionView reloadData];
                [self.collectionView.mj_header endRefreshing];
                if (self.meiNvVC.isMore) {
                    [self.collectionView.mj_footer resetNoMoreData];
                }else{
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
            }
            
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.meiNvVC getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                [self.collectionView reloadData];
                if (!self.meiNvVC.isMore) {
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
                [self.collectionView.mj_footer endRefreshing];
            }
        }];
    }];
    
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

#pragma mark <UICollectionViewDataSource>



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.meiNvVC.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TRMeiNvViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.iconImage setImageURL:[self.meiNvVC iconImageForItem:indexPath.row]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //创建一个黑色背景
    //初始化一个用来当做背景的View。我这里为了省时间计算，宽高直接用的5s的尺寸
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    background = bgView;
    [bgView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:bgView];
    
    //创建显示图像的视图
    //初始化要显示的图片内容的imageView（这里位置继续偷懒...没有计算）
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.contentMode = UIViewContentModeScaleToFill;
    //要显示的图片，即要放大的图片
    [imgView setImageURL:[self.meiNvVC selectIconImageForItem:indexPath.row]];
    //[imgView setImage:[UIImage imageNamed:@"dog"]];
    [bgView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        make.top.equalTo(0);
        make.bottom.equalTo(-20);
    }];
    //允许用户交互
    imgView.userInteractionEnabled = YES;
    //添加点击手势（即点击图片后退出全屏）
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeView)];
    [imgView addGestureRecognizer:tapGesture];
    
    [self shakeToShow:bgView];//放大过程中的动画
    self.tabBarController.tabBar.hidden = YES;
    
}

-(void)closeView{
    [background removeFromSuperview];
    self.tabBarController.tabBar.hidden = NO;
}
//放大过程中出现的缓慢动画
- (void) shakeToShow:(UIView*)aView{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
