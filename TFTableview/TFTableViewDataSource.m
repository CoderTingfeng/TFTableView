//
//  TFTableViewDataSource.m
//  TFTableviewDemo
//
//  Created by 江霆锋 on 2017/4/10.
//  Copyright © 2017年 江霆锋. All rights reserved.
//

#import "TFTableViewDataSource.h"

@implementation TFTableViewDataSource
- (NSMutableArray<__kindof NSArray *> *) sectionItems
{
    if (!_sectionItems) {
        _sectionItems = [NSMutableArray array];
    }
    return _sectionItems;
}

- (NSMutableArray<__kindof TFBaseTableViewCellModel *> *) cellModels
{
    if (!_cellModels) {
        _cellModels = [NSMutableArray array];
    }
    return _cellModels;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_sectionItems)
    {
        return _sectionItems.count;
    }
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_sectionItems) {
        NSArray *rows = [_sectionItems objectAtIndex:section];
        return rows.count;
    }
    
    return [_cellModels count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFBaseTableViewCellModel *obj = nil;
    if (_sectionItems)
    {
        NSArray *rows = [_sectionItems objectAtIndex:indexPath.section];
        obj = [rows objectAtIndex:indexPath.row];
    }else
    {
        obj = [_cellModels objectAtIndex:indexPath.row];
    }
    
    TFBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:obj.singleIdentifier forIndexPath:indexPath];
    cell.model = obj;
    return cell;
}


- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFBaseTableViewCellModel *obj = nil;
    if (_sectionItems) {
        NSArray *rows = [_sectionItems objectAtIndex:indexPath.section];
        obj = [rows objectAtIndex:indexPath.row];
    } else {
        obj = [_cellModels objectAtIndex:indexPath.row];
    }
    
    return obj.cellEnableEdit;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    TFBaseTableViewCellModel  *obj = nil;
    if (_sectionItems) {
        NSArray *rows = [_sectionItems objectAtIndex:indexPath.section];
        obj = [rows objectAtIndex:indexPath.row];
    } else {
        obj = [_cellModels objectAtIndex:indexPath.row];
    }
    if (obj)
    {
        if (editingStyle == UITableViewCellEditingStyleDelete) {
            if (obj.cellDeleteHandler) {
                obj.cellDeleteHandler(obj);
            }
        }else if (UITableViewCellEditingStyleInsert == editingStyle)
        {
            if (obj.cellInsetHandler) {
                obj.cellInsetHandler(obj);
            }
        }
    }
    
}


- (CGFloat) cellHeightWithTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    TFBaseTableViewCellModel *obj = nil;
    if (_sectionItems)
    {
        NSArray *rows = [_sectionItems objectAtIndex:indexPath.section];
        obj = [rows objectAtIndex:indexPath.row];
    }else
    {
        obj = [_cellModels objectAtIndex:indexPath.row];
    }
    Class cellClass = [self.registerClassDictionary objectForKey:obj.singleIdentifier];
    return [cellClass cellHeightWithTableView:tableView cellModel:obj];
}


- (void) didSelectRowWithTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    TFBaseTableViewCellModel *obj = nil;
    if (_sectionItems)
    {
        NSArray *rows = [_sectionItems objectAtIndex:indexPath.section];
        obj = [rows objectAtIndex:indexPath.row];
    }else
    {
        obj = [_cellModels objectAtIndex:indexPath.row];
    }
    
    if (obj.didSelectedHandler) {
        obj.didSelectedHandler(obj);
    }
}

- (void) didDeselectRowWithTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath
{
    TFBaseTableViewCellModel *obj = nil;
    if (_sectionItems)
    {
        NSArray *rows = [_sectionItems objectAtIndex:indexPath.section];
        obj = [rows objectAtIndex:indexPath.row];
    }else
    {
        obj = [_cellModels objectAtIndex:indexPath.row];
    }
    
    if (obj.didSelectedHandler) {
        obj.didSelectedHandler(obj);
    }
}


@end


@implementation UITableView (FitDataSource)

- (void) addDataSource:(__kindof TFTableViewDataSource<UITableViewDataSource> *)dataSource
{
    self.dataSource = dataSource;
    [dataSource.registerClassDictionary enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, Class  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [self registerClass:obj forCellReuseIdentifier:key];
    }];
}

- (void) addRegisterClassDictionary:(NSDictionary<NSString *,Class> *)objects
{
    if (self.dataSource && [self.dataSource isKindOfClass:[TFTableViewDataSource class]])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict addEntriesFromDictionary:objects];
        TFTableViewDataSource *data = (TFTableViewDataSource *)self.dataSource;
        if (data.registerClassDictionary)
        {
            [dict addEntriesFromDictionary:data.registerClassDictionary];
        }
        data.registerClassDictionary = dict;
    }
    
    [objects enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, Class  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [self registerClass:obj forCellReuseIdentifier:key];
        
    }];
    
}

@end



