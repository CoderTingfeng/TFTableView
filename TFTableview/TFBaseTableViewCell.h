//
//  TFBaseTableViewCell.h
//  TFTableviewDemo
//
//  Created by 江霆锋 on 2017/4/10.
//  Copyright © 2017年 江霆锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFBaseTableViewDefine.h"
@interface TFBaseTableViewCellModel : NSObject

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, assign) UIEdgeInsets bottomLineInsets;

@property (nonatomic, assign) BOOL bottomLineIsHidden;

@property (nonatomic, copy) void(^didSelectedHandler)(id aCellModel);

/**
 *  取消重用
 */
@property (nonatomic, copy) NSString *singleIdentifier;

+ (NSString *) identifier;

@property (nonatomic, assign) BOOL cellEnableEdit;

@property (nonatomic, copy) void(^cellDeleteHandler)(id model);

@property (nonatomic, copy) void(^cellInsetHandler)(id model);

@end


@interface TFBaseTableViewCell : UITableViewCell

@property (nonatomic, readonly) UIView *bottomLine;

@property (nonatomic, assign) UIEdgeInsets bottomLineInsets;

@property (nonatomic, strong) TFBaseTableViewCellModel *model;

+ (CGFloat) cellHeightWithTableView:(UITableView *)tableView cellModel:(TFBaseTableViewCellModel *)cellModel;
@end
