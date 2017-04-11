//
//  ViewController.m
//  TFTableviewDemo
//
//  Created by 江霆锋 on 2017/4/10.
//  Copyright © 2017年 江霆锋. All rights reserved.
//

#import "ViewController.h"
#import "TFTableViewDataSource.h"
#import "TFNormalTableViewCell.h"
#import "TFEmptyTableViewCell.h"
#import "ViewController2.h"

@interface ViewController ()<UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

/**
 tableview datasource代理对象
 */
@property (nonatomic, strong) TFTableViewDataSource *dataSource;

@property (nonatomic, strong) TFNormalTableViewCellModel *CM1;

@property (nonatomic, strong) TFNormalTableViewCellModel *CM2;
/**
 一个空CM 做cell之间的间隔
 */
@property (nonatomic ,strong) TFEmptyTableViewCellModel *emptyCM;

@end

@implementation ViewController

-(TFEmptyTableViewCellModel *)emptyCM{

    if (!_emptyCM) {
        _emptyCM = [[TFEmptyTableViewCellModel alloc]init];
        _emptyCM.cellHeight = 10;
        _emptyCM.bgColor = [UIColor yellowColor];
    }
    return _emptyCM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"不分组";
    self.view.backgroundColor = [UIColor grayColor];
    
    
    [self setupTableView];
    
    [self createCellModel];
    
    
}

- (void)setupTableView{

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.dataSource = [[TFTableViewDataSource alloc] init];
    
    //注册cell
    self.dataSource.registerClassDictionary = @{[TFNormalTableViewCellModel identifier] : [TFNormalTableViewCell class], [TFEmptyTableViewCellModel identifier] : [TFEmptyTableViewCell class]};
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.delegate = self;
    [self.tableView addDataSource:self.dataSource];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //如果不想设置固定cellHeight 可以设置自适应高度
    self.tableView.estimatedRowHeight = 44;
}

- (void)createCellModel{
    __weak ViewController *weakSelf = self;
    self.CM1 = ({
        TFNormalTableViewCellModel *model = [[TFNormalTableViewCellModel alloc] init];
        model.cellHeight = 60;
        model.title = @"CM1:高度固定为60的cell，分割线左缩进为15,";
        model.btnTitle = @"添加";
        model.btnHiden = NO;
        model.bottomLineInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        model.bottomLineIsHidden = NO;
        model;
    });
    [self.dataSource.cellModels addObject:self.CM1];
    self.CM1.btnClickHandler = ^(TFNormalTableViewCellModel *amodel){
        
        //往底部添加一个CM
        [weakSelf.dataSource.cellModels addObject:({
            TFNormalTableViewCellModel *model = [[TFNormalTableViewCellModel alloc] init];
            //cellHeight自适应高度
            model.cellHeight = UITableViewAutomaticDimension;
            model.title = @"CM:自适应高度的cell，分割线左缩进为0";
            model.btnTitle = @"删除";
            model.btnHiden = NO;
            model.cellEnableEdit = YES;
            model.bottomLineInsets = UIEdgeInsetsMake(0, 0, 0, 0);
            model.bottomLineIsHidden = NO;
            
            //btn的点击事件
            model.btnClickHandler = ^(TFNormalTableViewCellModel *amodel){
                //取CM2行号Index
                NSInteger index = [weakSelf.dataSource.cellModels indexOfObject:amodel];
                //dataSource删掉CM2
                [weakSelf.dataSource.cellModels removeObjectAtIndex:index];
                //刷新
                [weakSelf.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
                
            };
            
            //cell的删除操作
            model.cellDeleteHandler = ^(TFNormalTableViewCellModel *amodel){
                
                NSInteger index = [weakSelf.dataSource.cellModels indexOfObject:amodel];
                
                [weakSelf.dataSource.cellModels removeObjectAtIndex:index];
                
                [weakSelf.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
                
            };

            
            model;
        })];
        
        [weakSelf.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[weakSelf.dataSource.cellModels count] - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
        
    };
    
    [self.dataSource.cellModels addObject:self.emptyCM];
    

    self.CM2 = ({
        TFNormalTableViewCellModel *model = [[TFNormalTableViewCellModel alloc] init];
        model.cellHeight = 80;
        model.btnTitle = @"跳转";
        model.btnHiden = NO;
        model.title = @"CM2:高度为80的cell，隐藏分割线";
        model.bottomLineIsHidden = YES;
        model.btnClickHandler = ^(TFNormalTableViewCellModel *aM)
        {
            
            ViewController2 *vc = [[ViewController2 alloc]init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        model;
    });
    [self.dataSource.cellModels addObject:self.CM2];
    [self.dataSource.cellModels addObject:self.emptyCM];

}


/**
 实现自定义dataSource
 */
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.dataSource cellHeightWithTableView:tableView atIndexPath:indexPath];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.dataSource didSelectRowWithTableView:tableView atIndexPath:indexPath];
}

@end
