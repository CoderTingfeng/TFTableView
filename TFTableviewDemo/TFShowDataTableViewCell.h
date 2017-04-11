//
//  TFShowDataTableViewCell.h
//  TFTableviewDemo
//
//  Created by 江霆锋 on 2017/4/11.
//  Copyright © 2017年 江霆锋. All rights reserved.
//

#import "TFBaseTableViewCell.h"

@interface TFShowDataTableViewCellModel : TFBaseTableViewCellModel

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *price;

@end

@interface TFShowDataTableViewCell : TFBaseTableViewCell

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic ,strong) UILabel *priceLabel;

@property (nonatomic, strong) TFShowDataTableViewCellModel *model;

@end
