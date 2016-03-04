//
//  RXFIBaseCell.h
//  RXTableViewItemExample
//
//  Created by Rush.D.Xzj on 16/3/4.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RXCell.h"

// default: 15
extern const NSString *kRXFIBaseCellAttributeName_leftPadding;
// default: 15
extern const NSString *kRXFIBaseCellAttributeName_rightPadding;
// default: 20
extern const NSString *kRXFIBaseCellAttributeName_imageViewWidth;
// default: 20
extern const NSString *kRXFIBaseCellAttributeName_imageViewHeight;
// default: 10, imageView and lable offset
extern const NSString *kRXFIBaseCellAttributeName_imageViewAndLabelOffset;
// default: 20
extern const NSString *kRXFIBaseCellAttributeName_arrowImageViewWidth;
// default: 20
extern const NSString *kRXFIBaseCellAttributeName_arrowImageViewHeight;
// default: 10, label and arrowImageView offset
extern const NSString *kRXFIBaseCellAttributeName_labelAndArrowImageViewOffset;
// default: 0.5
extern const NSString *kRXFIBaseCellAttributeName_lineViewHeight;



@interface RXFIBaseCell : RXCell

@property (nonatomic, strong) UIImageView *rx_imageView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UIView *bottomLineView;
@property (nonatomic, strong) UIView *topLineView;


// 当没有image的时候,label的frame
@property (nonatomic, assign) CGRect rectLblNoIV;
// 当有image的时候,label的frame
@property (nonatomic, assign) CGRect rectLblHaveIV;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier attributeDic:(NSDictionary *)attributeDic;

@end
