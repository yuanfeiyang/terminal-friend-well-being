//
//  TRThereController.m
//  TRProject
//
//  Created by spare on 16/7/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRThereController.h"

@interface TRThereController ()

@end

@implementation TRThereController
- (void)returnClicked{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *lefeItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(returnClicked)];
    lefeItem.tintColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = lefeItem;
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

@end
