//
//  TFBaseTableViewDefine.h
//  TFTableviewDemo
//
//  Created by 江霆锋 on 2017/4/10.
//  Copyright © 2017年 江霆锋. All rights reserved.
//

#ifndef TFBaseTableViewDefine_h
#define TFBaseTableViewDefine_h

#import "Masonry.h"


#define Hexcolor(value)    [UIColor colorWithRed:((float)((value & 0xFF0000) >> 16))/255.0 \
green:((float)((value & 0xFF00) >> 8))/255.0 \
blue:((float)(value & 0xFF))/255.0 alpha:1.0]


#define TFBaseTableVewDefineBackgroundColor           Hexcolor(0xf7f7f7)

#endif /* TFBaseTableViewDefine_h */
