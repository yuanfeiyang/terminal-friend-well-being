//
//  TRMotorViewController.h
//  TRProject
//
//  Created by spare on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRInforMationViewModel.h"

@interface TRMotorViewController : UIViewController
//- (instancetype)initWithStyle:(UITableViewStyle)style informationType:(InformationType)type;
- (instancetype)initWithInformationType:(InformationType)type;
/** <#属性描述#> */
@property (nonatomic, readonly) InformationType informationType;

@end
