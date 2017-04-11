//
//  TFShowDataTableViewCell.m
//  TFTableviewDemo
//
//  Created by 江霆锋 on 2017/4/11.
//  Copyright © 2017年 江霆锋. All rights reserved.
//

#import "TFShowDataTableViewCell.h"

@implementation TFShowDataTableViewCell
@synthesize model = _model;

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        _nameLabel = ({
            UILabel *aLabel = [[UILabel alloc]init];
            aLabel.textAlignment = NSTextAlignmentLeft;
            aLabel.font = [UIFont systemFontOfSize:16];
            aLabel.textColor = [UIColor blackColor];
            aLabel;
        });
        [self.contentView addSubview:_nameLabel];
        
        
        _priceLabel = ({
            UILabel *aLabel = [[UILabel alloc]init];
            aLabel.textAlignment = NSTextAlignmentLeft;
            aLabel.font = [UIFont systemFontOfSize:14];
            aLabel.textColor = [UIColor blackColor];
            aLabel;
        });
        [self.contentView addSubview:_priceLabel];
        
        
        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.left.equalTo(@(0));
            
        }];
        
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(@(0));
            make.right.equalTo(@(-20));
        }];
        
        
        
    }
    return self;
    
}

- (void) setModel:(TFShowDataTableViewCellModel *)model
{
    _model = model;
    
    self.nameLabel.text = model.name;
    
    self.priceLabel.text = model.price;
    
    self.bottomLineInsets = model.bottomLineInsets;
    
    self.bottomLine.hidden = model.bottomLineIsHidden;
}

@end


@implementation TFShowDataTableViewCellModel

/**
 设置重用标识符
 */
+ (NSString *) identifier
{
    return @"TFShowDataTableViewCell";
}

@end
