//
//  RXFunctionItem.h
//  Shangqian
//
//  Created by Rush.D.Xzj on 14-10-16.
//  Copyright (c) 2014年 Wanda Inc. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RXFunctionItem : NSObject

@property (nonatomic, copy) NSString *iconName;     // 图片名称
@property (nonatomic, copy) NSString *title;        // 名称
@property (nonatomic, assign) SEL action;           // action
@property (nonatomic, assign) NSInteger type;             // type
@property (nonatomic, strong) id object;            // 扩展数据



- (id)initWithIconName:(NSString *)iconName title:(NSString *)title action:(SEL)action type:(NSInteger)type;
- (id)initWithIconName:(NSString *)iconName title:(NSString *)title action:(SEL)action type:(NSInteger)type object:(id)object;


@end
