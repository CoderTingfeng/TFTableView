//
//  TFDataModel.m
//  TFTableviewDemo
//
//  Created by 江霆锋 on 2017/4/11.
//  Copyright © 2017年 江霆锋. All rights reserved.
//

#import "TFDataModel.h"

@implementation TFDataModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.price = dict[@"price"];
    }
    return self;
}

+(instancetype)productWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
