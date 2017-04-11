//
//  TFBaseTableViewCell.m
//  TFTableviewDemo
//
//  Created by 江霆锋 on 2017/4/10.
//  Copyright © 2017年 江霆锋. All rights reserved.
//

#import "TFBaseTableViewCell.h"

@implementation TFBaseTableViewCell

+ (CGFloat) cellHeightWithTableView:(UITableView *)tableView cellModel:(TFBaseTableViewCellModel *)cellModel
{
    return cellModel.cellHeight;
}


- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _bottomLine = [[UIView alloc] init];
        [self.contentView addSubview:_bottomLine];
        
        _bottomLine.backgroundColor = Hexcolor(0xdddddd);
        [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.right.equalTo(@0);
            make.bottom.equalTo(@0);
            make.height.equalTo(@(1.0 / [UIScreen mainScreen].scale));
        }];
        _bottomLine.hidden = YES;
    }
    return self;
}


/**
 设置cell的bottom的分割线
 */
- (void) setBottomLineInsets:(UIEdgeInsets)bottomLineInsets
{
    _bottomLineInsets = bottomLineInsets;
    
    _bottomLine.hidden = NO;
    [_bottomLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(bottomLineInsets.left));
        make.right.equalTo(@(-bottomLineInsets.right));
        make.bottom.equalTo(@0);
        make.height.equalTo(@(1.0 / [UIScreen mainScreen].scale));
    }];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
}
@end

@implementation TFBaseTableViewCellModel

- (id) init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

+ (NSString *) identifier
{
    return @"TFBaseTableViewCell";
}

- (NSString *) singleIdentifier
{
    if (_singleIdentifier)
    {
        return _singleIdentifier;
    }
    return [[self class] identifier];
}

@end

