//
//  RXCell.m
//  Taka
//
//  Created by Rush.D.Xzj on 15-1-20.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXCell.h"

@implementation RXCell


- (void)setData:(id)data
{
    // Do Nothing
}

- (void)awakeFromNib {
    // Initialization code
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


+ (id)cell_xib
{
    NSArray *nibView =  [[NSBundle mainBundle] loadNibNamed:[self identifier] owner:nil options:nil];
    return nibView[0];
}

+ (instancetype)cell
{
    Class cls = [self class];
    id cell = [[cls alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self identifier]];
    return cell;
}



+ (CGFloat)cellHeight
{
    return 0;
}

+ (NSString *)identifier
{
    return NSStringFromClass([self class]);
}
@end
