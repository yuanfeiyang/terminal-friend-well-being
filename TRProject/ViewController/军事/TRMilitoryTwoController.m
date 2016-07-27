//
//  TRMilitoryTwoController.m
//  TRProject
//
//  Created by spare on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRMilitoryTwoController.h"
#import "TRMilitaryTwoViewCell.h"
#import "TRMilitaryTwoViewModel.h"
@interface TRMilitoryTwoController ()
/** <#属性描述#> */
@property (nonatomic) TRMilitaryTwoViewModel *militaryTwoVM;
@end

@implementation TRMilitoryTwoController

static NSString * const reuseIdentifier = @"Cell";
- (instancetype)initWithID:(NSString *)ID{
    if (self = [super init]) {
        self.ID = ID;
    }
    return self;
}
- (TRMilitaryTwoViewModel *)militaryTwoVM{
    if (!_militaryTwoVM) {
        _militaryTwoVM = [TRMilitaryTwoViewModel new];
    }
    return _militaryTwoVM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"11111%@",self.ID);
    [self.tableView registerClass:[TRMilitaryTwoViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.militaryTwoVM getMilitaryWithID:self.ID CompletionHandler:^(NSError *error) {
        [self.tableView reloadData];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.militaryTwoVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TRMilitaryTwoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconImage setImageURL:[self.militaryTwoVM urlForRow:indexPath.row]];
    cell.titleLb.text = [self.militaryTwoVM titleForRow:indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"Cell" configuration:^(TRMilitaryTwoViewCell *cell) {
        
        [cell.iconImage setImageURL:[self.militaryTwoVM urlForRow:indexPath.row]];
        cell.titleLb.text = [self.militaryTwoVM titleForRow:indexPath.row];
        
    }];
}

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
