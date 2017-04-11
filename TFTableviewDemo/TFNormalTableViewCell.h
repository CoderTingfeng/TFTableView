//
//  TFNormalTableViewCell.h
//  TFTableviewDemo
//
//  Created by 江霆锋 on 2017/4/10.
//  Copyright © 2017年 江霆锋. All rights reserved.
//

#import "TFBaseTableViewCell.h"

@interface TFNormalTableViewCellModel : TFBaseTableViewCellModel

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *btnTitle;

@property (nonatomic ,assign) BOOL btnHiden;

@property (nonatomic, copy) void(^btnClickHandler)(TFNormalTableViewCellModel *model);

@end

@interface TFNormalTableViewCell : TFBaseTableViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic ,strong) UIButton *btn;

@property (nonatomic, strong) TFNormalTableViewCellModel *model;

@end
