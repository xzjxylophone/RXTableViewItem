//
//  RXCell.h
//  Taka
//
//  Created by Rush.D.Xzj on 15-1-20.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>


// 所以TableViewCell的基类
@interface RXCell : UITableViewCell


// 用data更新cell数据
- (void)setData:(id)data;


// 从xib中获取cell,记得在xib设置identify
+ (id)cell_xib;
// 用initWithStyle:reuseIdentifier:方式获取cell
+ (instancetype)cell;


// cell 的高度,需要子类去实现
+ (CGFloat)cellHeight;
// 默认的是Class的字符串,子类不需要重写
+ (NSString *)identifier;
@end
