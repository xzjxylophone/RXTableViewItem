//
//  RXFIBaseCell.m
//  RXTableViewItemExample
//
//  Created by Rush.D.Xzj on 16/3/4.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RXFIBaseCell.h"
#import "RXFunctionItem.h"



const NSString *kRXFIBaseCellAttributeName_leftPadding = @"kRXFIBaseCellAttributeName_leftPadding";
const NSString *kRXFIBaseCellAttributeName_rightPadding = @"kRXFIBaseCellAttributeName_rightPadding";
const NSString *kRXFIBaseCellAttributeName_imageViewWidth = @"kRXFIBaseCellAttributeName_imageViewWidth";
const NSString *kRXFIBaseCellAttributeName_imageViewHeight = @"kRXFIBaseCellAttributeName_imageViewHeight";
const NSString *kRXFIBaseCellAttributeName_imageViewAndLabelOffset = @"kRXFIBaseCellAttributeName_imageViewAndLabelOffset";
const NSString *kRXFIBaseCellAttributeName_arrowImageViewWidth = @"kRXFIBaseCellAttributeName_arrowImageViewWidth";
const NSString *kRXFIBaseCellAttributeName_arrowImageViewHeight = @"kRXFIBaseCellAttributeName_arrowImageViewHeight";
const NSString *kRXFIBaseCellAttributeName_labelAndArrowImageViewOffset = @"kRXFIBaseCellAttributeName_labelAndArrowImageViewOffset";

const NSString *kRXFIBaseCellAttributeName_lineViewHeight = @"kRXFIBaseCellAttributeName_lineViewHeight";


@interface RXFIBaseCell ()

@property (nonatomic, strong) NSDictionary *attributeDic;

@end

@implementation RXFIBaseCell


- (void)setData:(id)data
{
    if ([data isKindOfClass:[RXFunctionItem class]]) {
        RXFunctionItem *tmp = data;
        [self.rx_imageView removeFromSuperview];
        UIImage *image = [UIImage imageNamed:tmp.iconName];
        if (image != nil) {
            self.rx_imageView.image = image;
            [self addSubview:self.rx_imageView];
            self.label.frame = self.rectLblHaveIV;
        } else {
            self.label.frame = self.rectLblNoIV;
        }
        self.label.text = tmp.title;
        
    } else {
        
    }
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier attributeDic:(NSDictionary *)attributeDic
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.attributeDic = attributeDic;
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        // 获取当前自己Cell的高度
        Class cls = [self class];
        CGFloat height = [cls cellHeight];
        CGFloat ivX = [self leftPadding];
        CGFloat ivWidth = [self imageViewWidth];
        CGFloat ivHeight = [self imageViewHeight];
        CGFloat ivY = (height - ivHeight) / 2.0f;
        self.rx_imageView = [[UIImageView alloc] initWithFrame:CGRectMake(ivX, ivY, ivWidth, ivHeight)];
        CGFloat lblHeight = height;
        CGFloat lblY = (height - lblHeight) / 2.0;
        CGFloat paddingLblAndIv = [self imageViewAndLabelOffset];
        self.label = [[UILabel alloc] initWithFrame:self.rectLblHaveIV];
        CGFloat ivArrowWidth = [self arrowImageViewWidth];
        CGFloat ivArrowHeight = [self arrowImageViewHeight];
        CGFloat rightPadding = [self rightPadding];
        CGFloat ivArrowX = width - ivArrowWidth - rightPadding;
        CGFloat ivArrowY = (height - ivArrowHeight) / 2.0;
        self.arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ivArrowX, ivArrowY, ivArrowWidth, ivArrowHeight)];
        CGFloat vLineX = self.rectLblHaveIV.origin.x;
        CGFloat vLineWidth = width - vLineX;
        
        CGFloat lineViewHeight = [self lineViewHeight];
        
        
        
        self.topLineView = [[UIView alloc] initWithFrame:CGRectMake(vLineX, 0, vLineWidth, lineViewHeight)];
        
        self.bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(vLineX, height - lineViewHeight, vLineWidth, lineViewHeight)];
        
        CGFloat labelAndArrowImageViewOffset = [self labelAndArrowImageViewOffset];

        self.rectLblNoIV = CGRectMake(ivX, lblY, ivArrowX - labelAndArrowImageViewOffset, lblHeight);
        CGFloat lableX = ivX + ivWidth + paddingLblAndIv;
        self.rectLblHaveIV = CGRectMake(lableX, lblY, ivArrowX - labelAndArrowImageViewOffset, lblHeight);
        
        [self addSubview:self.label];
        [self addSubview:self.arrowImageView];
        [self addSubview:self.topLineView];
        [self addSubview:self.bottomLineView];
    }
    return self;
}


#pragma mark - Attribute
- (CGFloat)floatValueWithKey:(const NSString *)key defatulValue:(CGFloat)defaultValue
{
    id data = self.attributeDic[key];
    if (data == nil) {
        return defaultValue;
    } else {
        return [data floatValue];
    }
}
- (CGFloat)leftPadding
{
    return [self floatValueWithKey:kRXFIBaseCellAttributeName_leftPadding defatulValue:15.0f];
}
- (CGFloat)rightPadding
{
    return [self floatValueWithKey:kRXFIBaseCellAttributeName_rightPadding defatulValue:15.0f];
}


- (CGFloat)imageViewWidth
{
    return [self floatValueWithKey:kRXFIBaseCellAttributeName_imageViewWidth defatulValue:20.0f];
}


- (CGFloat)imageViewHeight
{
    return [self floatValueWithKey:kRXFIBaseCellAttributeName_imageViewHeight defatulValue:20.0f];
}



- (CGFloat)imageViewAndLabelOffset
{
    return [self floatValueWithKey:kRXFIBaseCellAttributeName_imageViewAndLabelOffset defatulValue:10.0f];
}



- (CGFloat)arrowImageViewWidth
{
    return [self floatValueWithKey:kRXFIBaseCellAttributeName_arrowImageViewWidth defatulValue:20.0f];
}

- (CGFloat)arrowImageViewHeight
{
    return [self floatValueWithKey:kRXFIBaseCellAttributeName_arrowImageViewHeight defatulValue:20.0f];
}
- (CGFloat)labelAndArrowImageViewOffset
{
    return [self floatValueWithKey:kRXFIBaseCellAttributeName_labelAndArrowImageViewOffset defatulValue:10.0f];
}

- (CGFloat)lineViewHeight
{
    return [self floatValueWithKey:kRXFIBaseCellAttributeName_lineViewHeight defatulValue:0.5f];
}





@end
