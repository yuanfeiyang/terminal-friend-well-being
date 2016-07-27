//
//  TRArticleViewController.m
//  TRProject
//
//  Created by Yuanfeiyang on 16/7/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRArticleViewController.h"
#import "TRArticleViewModel.h"
#import "TRArticelTwoViewController.h"
#import "CCDraggableContainer.h"
#import "CustomCardView.h"

@interface TRArticleViewController ()<
CCDraggableContainerDataSource,
CCDraggableContainerDelegate
>


@property (nonatomic) TRArticleViewModel *articleVM;

@property (nonatomic, strong) CCDraggableContainer *container;
@property (nonatomic, strong) NSMutableArray *dataSources;

@property (nonatomic, strong) UIButton *buttonLeft;
@property (nonatomic, strong) UIButton *buttonCenter;
@property (nonatomic, strong) UIButton *buttonRight;


@end

@implementation TRArticleViewController
- (CCDraggableContainer *)container{
    if (!_container) {
       _container = [[CCDraggableContainer alloc] initWithFrame:CGRectMake(0, 64, CCWidth, CCWidth) style:CCDraggableStyleUpOverlay];
//        _container = [[CCDraggableContainer alloc] initWithFrame:CGRectNull style:CCDraggableStyleUpOverlay];
//        [_container mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.equalTo(0);
//            make.top.equalTo(64);
//            make.height.equalTo(CCWidth);
//        }];
        _container.backgroundColor = kRGBColor(232, 239, 246, 1.0);
        _container.delegate = self;
        _container.dataSource = self;
        [self.view addSubview:_container];
        
    }
    return _container;
}
- (UIButton *)buttonLeft{
    if (!_buttonLeft) {
        _buttonLeft = [UIButton buttonWithType:UIButtonTypeSystem];
       // [_buttonLeft setTitle:@"左边" forState:UIControlStateNormal];
        
        //_buttonLeft.frame = CGRectMake(10, self.view.frame.size.height-250, 100, 100);
        [self.view addSubview:_buttonLeft];
        [_buttonLeft mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            //make.top.equalTo(self.container.mas_bottom).equalTo(10);
            make.bottom.equalTo(-55);
            make.size.equalTo(CGSizeMake(65, 65));
        }];
        [_buttonLeft addTarget:self action:@selector(clickBtnLefe) forControlEvents:UIControlEventTouchUpInside];
        [_buttonLeft setImage:[UIImage imageNamed:@"nope"] forState:UIControlStateNormal];
        [_buttonLeft setBackgroundImage:[UIImage imageNamed:@"nope"] forState:UIControlStateNormal];
    }
    return _buttonLeft;
}
- (void)clickBtnLefe{
    [self.container removeFormDirection:CCDraggableDirectionLeft];
}
- (UIButton *)buttonCenter{
    if (!_buttonCenter) {
        _buttonCenter = [UIButton buttonWithType:UIButtonTypeSystem];
        //[_buttonCenter setTitle:@"左边" forState:UIControlStateNormal];
        [self.view addSubview:_buttonCenter];
        //_buttonCenter.frame = CGRectMake(165, self.view.frame.size.height-240, 80, 80);
        CGFloat num = kScreenW/2-22.5;
        [_buttonCenter mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(num);
            //make.top.equalTo(self.container.mas_bottom).equalTo(20);
            make.bottom.equalTo(-65);
            make.size.equalTo(CGSizeMake(45, 45));
        }];
         [_buttonCenter addTarget:self action:@selector(clickBtnCenter) forControlEvents:UIControlEventTouchUpInside];
        [_buttonCenter setImage:[UIImage imageNamed:@"userInfo"] forState:UIControlStateNormal];
    }
    return _buttonCenter;
}
- (void)clickBtnCenter{
    if (self.container) {
        [self.container reloadData];
    }
}
- (UIButton *)buttonRight{
    if (!_buttonRight) {
        _buttonRight = [UIButton buttonWithType:UIButtonTypeSystem];
       // [_buttonRight setTitle:@"右边" forState:UIControlStateNormal];
        [self.view addSubview:_buttonRight];
        //_buttonRight.frame = CGRectMake(300, self.view.frame.size.height-250, 100, 100);
        [_buttonRight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            //make.top.equalTo(self.container.mas_bottom).equalTo(10);
            make.bottom.equalTo(-55);
            make.size.equalTo(CGSizeMake(65, 65));
        }];
        [_buttonRight addTarget:self action:@selector(clickBtnRight) forControlEvents:UIControlEventTouchUpInside];
        [_buttonRight setImage:[UIImage imageNamed:@"liked"] forState:UIControlStateNormal];
        
    }
    return _buttonRight;
}
- (void)clickBtnRight{
    [self.container removeFormDirection:CCDraggableDirectionRight];
}


- (TRArticleViewModel *)articleVM{
    if (!_articleVM) {
        _articleVM = [TRArticleViewModel new];
    }
    return _articleVM;
}
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"美文";
        self.tabBarItem.image = [UIImage imageNamed:@"recomicon_dock_press_night"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"recomicon_dock_press"];
        [self.articleVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            
            [self.container reloadData];
            
        }];
    }
    return self;
}
- (void)ReturnPage{
    [self.sideMenuViewController presentLeftMenuViewController];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRGBColor(232, 239, 246, 1.0);
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"分类" style:UIBarButtonItemStyleDone target:self action:@selector(ReturnPage)];
    leftItem.tintColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.title = @"每天好文";
    
    UIBarButtonItem *RightItem = [[UIBarButtonItem alloc]initWithTitle:@"随机" style:UIBarButtonItemStyleDone target:self action:@selector(RunPage)];
     self.navigationItem.rightBarButtonItem = RightItem;
    [self buttonLeft];
    [self buttonRight];
    [self buttonCenter];
    [self loadData];
    
    
}

- (void)RunPage{
    [self.articleVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
        [self loadData];
        [self.container reloadData];
    }];
}

- (void)loadData {
    
    _dataSources = [NSMutableArray array];
    
    for (int i = 0; i < 15; i++) {
        NSDictionary *dict = @{@"image" : [self.articleVM picForRow:i],
                               @"title" : [self.articleVM titleForRow:i]};
        [_dataSources addObject:dict];
    }
}

#pragma mark - CCDraggableContainer DataSource

- (CCDraggableCardView *)draggableContainer:(CCDraggableContainer *)draggableContainer viewForIndex:(NSInteger)index {
    
    CustomCardView *cardView = [[CustomCardView alloc] initWithFrame:draggableContainer.bounds];
    [cardView installData:[_dataSources objectAtIndex:index]];
    return cardView;
}

- (NSInteger)numberOfIndexs {
    return _dataSources.count;
}

#pragma mark - CCDraggableContainer Delegate

- (void)draggableContainer:(CCDraggableContainer *)draggableContainer draggableDirection:(CCDraggableDirection)draggableDirection widthRatio:(CGFloat)widthRatio heightRatio:(CGFloat)heightRatio {
    
    CGFloat scale = 1 + ((kBoundaryRatio > fabs(widthRatio) ? fabs(widthRatio) : kBoundaryRatio)) / 4;
    if (draggableDirection == CCDraggableDirectionLeft) {
        self.buttonLeft.transform = CGAffineTransformMakeScale(scale, scale);
    }
    if (draggableDirection == CCDraggableDirectionRight) {
        self.buttonRight.transform = CGAffineTransformMakeScale(scale, scale);
    }
}

- (void)draggableContainer:(CCDraggableContainer *)draggableContainer cardView:(CCDraggableCardView *)cardView didSelectIndex:(NSInteger)didSelectIndex {
    
   // NSLog(@"点击了Tag为%ld的Card", (long)didSelectIndex);
    TRArticelTwoViewController *articel = [TRArticelTwoViewController new];
    articel.idURL = [self.articleVM urlForRow:(long)didSelectIndex];
    articel.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:articel animated:YES];
    
}

- (void)draggableContainer:(CCDraggableContainer *)draggableContainer finishedDraggableLastCard:(BOOL)finishedDraggableLastCard {
    
    [draggableContainer reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
