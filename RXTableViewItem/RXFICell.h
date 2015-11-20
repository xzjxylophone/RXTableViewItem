//
//  RXFICell.h
//  YYTS
//
//  Created by Rush.D.Xzj on 15/8/13.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXCell.h"

@interface RXFICell : RXCell
@property (nonatomic, strong) UIImageView *iv;

@property (nonatomic, strong) UILabel *lbl;

@property (nonatomic, strong) UIImageView *ivArrow;
@property (nonatomic, strong) UIView *vLine;


// 当没有image的时候,label的frame
@property (nonatomic, assign) CGRect rectLblNoIV;
// 当有image的时候,label的frame
@property (nonatomic, assign) CGRect rectLblHaveIV;

@end
