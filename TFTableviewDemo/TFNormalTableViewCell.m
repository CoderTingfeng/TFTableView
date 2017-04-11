//
//  TFNormalTableViewCell.m
//  TFTableviewDemo
//
//  Created by 江霆锋 on 2017/4/10.
//  Copyright © 2017年 江霆锋. All rights reserved.
//

#import "TFNormalTableViewCell.h"

@implementation TFNormalTableViewCell
@synthesize model = _model;

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //如果要给cell添加分割线，并设置分割线的左右缩进
        self.bottomLineInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        
        _titleLabel = ({
            UILabel *aLabel = [[UILabel alloc]init];
            aLabel.textAlignment = NSTextAlignmentLeft;
            aLabel.font = [UIFont systemFontOfSize:14];
            aLabel.textColor = [UIColor blackColor];
          
            aLabel;
        });
        [self.contentView addSubview:_titleLabel];
        
        
        _btn = ({
            UIButton *aBtn = [[UIButton alloc]init];
            [aBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            aBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [aBtn addTarget:self action:@selector(btnClickHandler) forControlEvents:UIControlEventTouchUpInside];
            [aBtn setBackgroundImage:[UIImage imageNamed:@"btn_n3_default"] forState:UIControlStateNormal];
            [aBtn setBackgroundImage:[UIImage imageNamed:@"btn_n3_highlight"] forState:UIControlStateHighlighted];
            aBtn;
        });
        [self.contentView addSubview:_btn];
        
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.left.equalTo(@(0));
            make.right.equalTo(@(-40));
        }];
        
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@(10));
            make.right.equalTo(@(-12));
            make.width.equalTo(@(30));
            make.bottom.equalTo(@(-10));
        }];
        
        
        
    }
    return self;
    
}


- (void) setModel:(TFNormalTableViewCellModel *)model
{
    _model = model;
    
    self.titleLabel.text = model.title;
    
    [self.btn setTitle:model.btnTitle forState:UIControlStateNormal];
    
    self.btn.hidden = model.btnHiden;
    
    //如果外部需要控制不同cell分割线的隐藏和显示或者缩进，必须写下面代码，先写缩进，再写隐藏
    self.bottomLineInsets = model.bottomLineInsets;
    
    self.bottomLine.hidden = model.bottomLineIsHidden;
}


/**
 点击cell变灰
 若cell不可点击 则不需重写该方法
 */
- (void) setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    //要增加点击效果
    if (highlighted) {
        
        self.backgroundColor = [UIColor grayColor];
    }else
    {
        self.backgroundColor = [UIColor whiteColor];
    }
}


-(void)btnClickHandler{

    if (self.model.btnClickHandler) {
        self.model.btnClickHandler(self.model);
    }
}

@end



@implementation TFNormalTableViewCellModel

/**
  设置重用标识符
 */
+ (NSString *) identifier
{
    return @"TFNormalTableViewCell";
}

@end

