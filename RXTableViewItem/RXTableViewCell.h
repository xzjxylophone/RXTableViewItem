//
//  RXTableViewCell.h
//  Taka
//
//  Created by Rush.D.Xzj on 15-1-20.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RXTableViewCell : UITableViewCell
- (void)setData:(id)data;


+ (id)cell_xib;
+ (instancetype)cell;


+ (CGFloat)cellHeight;
+ (NSString *)identifier;
@end
