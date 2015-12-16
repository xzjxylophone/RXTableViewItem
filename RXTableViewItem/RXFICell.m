//
//  RXFICell.m
//  YYTS
//
//  Created by Rush.D.Xzj on 15/8/13.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXFICell.h"
#import "RXFunctionItem.h"
@interface RXFICell ()


@end

@implementation RXFICell


- (void)setData:(id)data
{
    if ([data isKindOfClass:[RXFunctionItem class]]) {
        RXFunctionItem *tmp = data;
        [self.rx_imageView removeFromSuperview];
        [self.label removeFromSuperview];
        UIImage *image = [UIImage imageNamed:tmp.iconName];
        if (image != nil) {
            self.rx_imageView.image = image;
            [self addSubview:self.rx_imageView];
            self.label.frame = self.rectLblHaveIV;
        } else {
            self.label.frame = self.rectLblNoIV;
        }
        if (tmp.title.length > 0) {
            self.label.text = tmp.title;
            [self addSubview:self.label];
        }
        CGFloat left = self.label.frame.origin.x;
        CGFloat height = self.frame.size.height;
        self.lineView.frame = CGRectMake(left, height - 0.5, [UIScreen mainScreen].bounds.size.width - left, 0.5);
    } else {
        
    }
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = 48;
        CGFloat ivX = 15;
        CGFloat ivWidth = 20;
        CGFloat ivHeight = ivWidth;
        CGFloat ivY = (height - ivHeight) / 2.0f;
        self.rx_imageView = [[UIImageView alloc] initWithFrame:CGRectMake(ivX, ivY, ivWidth, ivHeight)];
        CGFloat lblHeight = 30;
        CGFloat lblY = (height - lblHeight) / 2.0;
        CGFloat paddingLblAndIv = 10;
        self.rectLblNoIV = CGRectMake(ivX, lblY, width - ivX * 2, lblHeight);
        self.rectLblHaveIV = CGRectMake(ivX + ivWidth + paddingLblAndIv, lblY, width - ivWidth - 3*ivX, lblHeight);
        self.label = [[UILabel alloc] initWithFrame:self.rectLblHaveIV];
        CGFloat ivArrowWidth = 20;
        CGFloat ivArrowHeight = 20;
        CGFloat ivArrowX = width - ivWidth - 10;
        CGFloat ivArrowY = (height - ivArrowHeight) / 2.0;
        self.arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ivArrowX, ivArrowY, ivArrowWidth, ivArrowHeight)];
        [self addSubview:self.arrowImageView];
        CGFloat vLineX = self.rectLblHaveIV.origin.x;
        CGFloat vLineWidth = width - vLineX;
        self.lineView = [[UIView alloc] initWithFrame:CGRectMake(vLineX, height - 0.5, vLineWidth, 0.5)];
        [self addSubview:self.lineView];
        self.frame = CGRectMake(0, 0, width, height);
    }
    return self;
}

+ (CGFloat)cellHeight
{
    return 48;
}


@end
