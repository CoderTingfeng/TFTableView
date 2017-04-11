//
//  TFEmptyTableViewCell.m
//  TFTableviewDemo
//
//  Created by 江霆锋 on 2017/4/10.
//  Copyright © 2017年 江霆锋. All rights reserved.
//

#import "TFEmptyTableViewCell.h"
@interface TFEmptyTableViewCell ()

@property (nonatomic, assign) BOOL isDefaultColor;

@end
@implementation TFEmptyTableViewCell
@synthesize model = _model;

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
    }
    return self;
}

- (void) setModel:(TFEmptyTableViewCellModel *)model
{
    _model = model;
    self.bottomLineInsets = model.bottomLineInsets;
    self.bottomLine.hidden = model.bottomLineIsHidden;
    if (model.bgColor) {
        self.backgroundColor = model.bgColor;
        self.isDefaultColor = NO;
    }else
    {
        if (!self.isDefaultColor)
        {
            self.backgroundColor = [UIColor clearColor];
            self.isDefaultColor = YES;
        }
    }
    
}

@end

@implementation TFEmptyTableViewCellModel

- (id) init
{
    self = [super init];
    if (self)
    {
        self.bottomLineIsHidden = YES;
    }
    return self;
}

+ (NSString *) identifier
{
    return @"TFEmptyTableViewCell";
}

@end

