//
//  TestCell.m
//  RXTableViewItemExample
//
//  Created by Rush.D.Xzj on 15/11/20.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "TestCell.h"
#import "RXFunctionItem.h"


@interface TestCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;


@end

@implementation TestCell


- (void)setData:(id)data
{
    if ([data isKindOfClass:[RXFunctionItem class]]) {
        RXFunctionItem *tmp = data;
        self.lblTitle.text = tmp.title;
        
    }
}

- (void)awakeFromNib {
    // Initialization code
    self.lblTitle.backgroundColor = [UIColor redColor];
}





+ (CGFloat)cellHeight
{
    return 50;
}


@end
