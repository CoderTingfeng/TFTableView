//
//  ViewController2.m
//  TFTableviewDemo
//
//  Created by 江霆锋 on 2017/4/10.
//  Copyright © 2017年 江霆锋. All rights reserved.
//

#import "ViewController2.h"
#import "TFTableViewDataSource.h"
#import "TFNormalTableViewCell.h"
#import "TFEmptyTableViewCell.h"
#import "TFShowDataTableViewCell.h"
#import "TFDataModel.h"
@interface ViewController2 ()<UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

/**
 tableview datasource代理对象
 */
@property (nonatomic, strong) TFTableViewDataSource *dataSource;

/**
 分组
 */
@property (nonatomic, strong) NSMutableArray *firstSection;

@property (nonatomic, strong) NSMutableArray *secondSection;

@property (nonatomic, strong) NSMutableArray *thirdSection;

@property (nonatomic ,strong) TFShowDataTableViewCellModel *dataCM;

@property (nonatomic, strong) TFNormalTableViewCellModel *CM2;

@property (nonatomic, strong) TFNormalTableViewCellModel *CM3;

@property (nonatomic ,strong) TFEmptyTableViewCellModel *emptyCM;

@property (nonatomic ,strong) NSArray *dataArray;
@end

@implementation ViewController2


-(TFNormalTableViewCellModel *)CM2{
    
    if (!_CM2) {
        _CM2 = [[TFNormalTableViewCellModel alloc]init];
        _CM2.cellHeight = UITableViewAutomaticDimension;
        _CM2.title = @"section2:自适应高度的cell，分割线左缩进为15";
        _CM2.bottomLineInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        _CM2.bottomLineIsHidden = NO;
        _CM2.btnHiden = YES;
    }
    return _CM2;
}

-(TFNormalTableViewCellModel *)CM3{
    
    if (!_CM3) {
        _CM3 = [[TFNormalTableViewCellModel alloc]init];
        _CM3.cellHeight = 80;
        _CM3.title = @"section3:高度为80的cell，隐藏分割线";
        _CM3.bottomLineIsHidden = YES;
        _CM3.btnHiden = YES;
        
    }
    return _CM3;
}

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
    self.title = @"分组";
    self.view.backgroundColor = [UIColor grayColor];
    
    [self setupTableView];
    
    [self getDataFromPlistFile];
    
    [self setupSection];
    
    [self createCellModel:self.dataArray];
}


- (void)setupTableView{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.dataSource = [[TFTableViewDataSource alloc] init];
    
    self.dataSource.registerClassDictionary = @{[TFNormalTableViewCellModel identifier] : [TFNormalTableViewCell class], [TFEmptyTableViewCellModel identifier] : [TFEmptyTableViewCell class], [TFShowDataTableViewCellModel identifier] : [TFShowDataTableViewCell class]};
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.delegate = self;
    [self.tableView addDataSource:self.dataSource];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 44;

}


/**
 解析plist
 */
- (void)getDataFromPlistFile{
  
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSString *path = [bundle pathForResource:@"data" ofType:@"plist"];
    
    if (path) {
        self.dataArray = [NSArray arrayWithContentsOfFile:path];
    }
    
}


- (void)setupSection{
    
    self.firstSection = [NSMutableArray array];
    [self.dataSource.sectionItems addObject:self.firstSection];
    
    self.secondSection = [NSMutableArray array];
    [self.dataSource.sectionItems addObject:self.secondSection];
    
    self.thirdSection = [NSMutableArray array];
    [self.dataSource.sectionItems addObject:self.thirdSection];
    
    
}


- (void)createCellModel:(NSArray *)list{
    
    for (NSInteger i = 0; i < list.count; i ++) {
        TFDataModel *info = [TFDataModel productWithDict:[list objectAtIndex:i]];
        self.dataCM = ({
            TFShowDataTableViewCellModel *model = [[TFShowDataTableViewCellModel alloc]init];
            model.name = info.name;
            model.price = info.price;
            model.cellHeight = 44;
            model;
        });
        [self.firstSection addObject:self.dataCM];
        
    }
    [self.firstSection addObject:self.emptyCM];
    
    for (NSInteger i = 0; i < 5; i ++) {
        [self.secondSection addObject:self.CM2];
    }
    [self.secondSection addObject:self.emptyCM];
    
    
    for (NSInteger j = 0; j < 3; j ++) {
        [self.thirdSection addObject:self.CM3];
    }
    
    
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.dataSource cellHeightWithTableView:tableView atIndexPath:indexPath];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.dataSource didSelectRowWithTableView:tableView atIndexPath:indexPath];
}
@end
