//
//  TRMilitaryViewController.m
//  TRProject
//
//  Created by spare on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRMilitaryViewController.h"

#import "TRMilitaryViewCell.h"
#import "TRMilitoryTwoController.h"


@interface TRMilitaryViewController ()


/** <#属性描述#> */
@property (nonatomic) TRInforMationViewModel *informationVM;
@end

@implementation TRMilitaryViewController

static NSString * const reuseIdentifier = @"Cell";
- (TRInforMationViewModel *)informationVM{
    if (!_informationVM) {
        _informationVM = [[TRInforMationViewModel alloc]initWithType:_informationType];
    }
    return _informationVM;
}
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout informationType:(InformationType )type{
    if (self = [super initWithCollectionViewLayout:layout]) {
        _informationType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[TRMilitaryViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self.informationVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                [self.collectionView reloadData];
                [self.collectionView.mj_header endRefreshing];
                if (self.informationVM.isMore) {
                    [self.collectionView.mj_footer resetNoMoreData];
                }else{
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
                                     
    [self.collectionView.mj_header beginRefreshing];
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.informationVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            
                if (error) {
                    NSLog(@"%@",error);
                }else{
                    [self.collectionView reloadData];
                    if (!self.informationVM.isMore) {
                        [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                    }
                    [self.collectionView.mj_footer endRefreshing];
                }
          
        }];
    }];

    // Do any additional setup after loading the view.
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    //TRMilitoryTwoController *militaryTwoVC = [[TRMilitoryTwoController alloc]initWithID:[self.militaryVM IDForRow:indexPath.row]];
    TRMilitoryTwoController *militaryTwoVC = [[TRMilitoryTwoController alloc]initWithStyle:UITableViewStylePlain];
    militaryTwoVC.ID = [self.informationVM IDForRow:indexPath.row];
    militaryTwoVC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:militaryTwoVC animated:YES];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.informationVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TRMilitaryViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.iconImage setImageURL:[self.informationVM imgUrlForRow:indexPath.row]];
    cell.titleLb.text = [self.informationVM titleForRow:indexPath.row];
    
    return cell;
}



- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row > self.informationVM.numberCount-1) {
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
        [UIView  animateWithDuration:0.5 animations:^{
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
        }];
    }
    
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
