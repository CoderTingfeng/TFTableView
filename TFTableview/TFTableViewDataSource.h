//
//  TFTableViewDataSource.h
//  TFTableviewDemo
//
//  Created by 江霆锋 on 2017/4/10.
//  Copyright © 2017年 江霆锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFBaseTableViewCell.h"
@interface TFTableViewDataSource : NSObject<UITableViewDataSource>
/**
 *  注册cell
 */
@property (nonatomic, strong, nullable) NSDictionary<NSString *, Class> *registerClassDictionary;

/**
 *  分组时候使用，@[@[model...], ......]结构
 */
@property (nonatomic, strong, nullable) NSMutableArray<__kindof NSArray *> *sectionItems;

/**
 *  不分组时候使用
 */
@property (nonatomic, strong, nullable) NSMutableArray<__kindof TFBaseTableViewCellModel *> *cellModels;


/**
 *
 *  @return cell 高度
 */
- (CGFloat) cellHeightWithTableView:(nullable UITableView *)tableView atIndexPath:(nullable NSIndexPath *)indexPath;

/**
 *  - (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath代理中调用
 *
 */
- (void) didSelectRowWithTableView:(nullable UITableView *)tableView atIndexPath:(nullable NSIndexPath *)indexPath;

/**
 *  - (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath代理中调用
 */
- (void)didDeselectRowWithTableView:(nullable UITableView *)tableView atIndexPath:(nullable NSIndexPath *)indexPath;

@end


@interface UITableView (FitDataSource)

/**
 *  添加数据代理对象（代替set dataSource），并且将registerClassDictionary注册到tableView中
 *
 *  @param dataSource MLYTableViewDataSource类型对象或者子类对象
 */
- (void) addDataSource:(nullable __kindof TFTableViewDataSource<UITableViewDataSource> *)dataSource;

/**
 *  运行过程中注册cell
 *
 *  @param objects cell和identifier集合MLYTableViewDataSource，会更新TFTableViewDataSource的registerClassDictionary属性，非必要情况下不建议使用
 */
- (void) addRegisterClassDictionary:(nullable NSDictionary<NSString *, Class> *)objects;
@end
