//
//  TFDataModel.h
//  TFTableviewDemo
//
//  Created by 江霆锋 on 2017/4/11.
//  Copyright © 2017年 江霆锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFDataModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *price;

+(instancetype)productWithDict:(NSDictionary *)dict;

@end
