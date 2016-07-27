//
//  TRMilitaryViewController.h
//  TRProject
//
//  Created by spare on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRInforMationViewModel.h"

@interface TRMilitaryViewController : UICollectionViewController
//- (instancetype)initWithStyle:(UITableViewStyle)style dataListType:(DataListType)type;
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout informationType:(InformationType )type;
/** <#属性描述#> */
@property (nonatomic, readonly) InformationType informationType;


@end
