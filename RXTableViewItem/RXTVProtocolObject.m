//
//  RXTVProtocolObject.m
//  ZH
//
//  Created by Rush.D.Xzj on 16/3/2.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RXTVProtocolObject.h"
#import "RXTVSectionItem.h"
@implementation RXTVProtocolObject


#pragma mark - Public
- (NSArray *)sourceAryWithSection:(NSInteger)section
{
    id data = self.functionItems[section];
    if ([data isKindOfClass:[RXTVSectionItem class]]) {
        RXTVSectionItem *tmp = data;
        return tmp.items;
    } else if ([data isKindOfClass:[NSArray class]]) {
        NSArray *tmp = data;
        return tmp;
    } else {
        NSLog(@"maybe have error");
        return data;
    }
}

- (id)itemWithIndexPath:(NSIndexPath *)indexPath
{
    NSArray *ary = [self sourceAryWithSection:indexPath.section];
    return ary[indexPath.row];
}

#pragma mark - Private
- (void)fillAllInSuperView:(UIView *)superView subView:(UIView *)subView
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:superView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [superView addConstraints:@[lc1, lc2, lc3, lc4]];
    
}


#pragma mark - UITableViewDataSource
#pragma mark Required
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.functionItems.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *ary = [self sourceAryWithSection:section];
    return ary.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id data = [self itemWithIndexPath:indexPath];
    if ([data isKindOfClass:[UIView class]]) {
        UIView *view = data;
        NSString *identify = @"view_cell_identify";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
            cell.backgroundColor = [UIColor clearColor];
            cell.contentView.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        NSArray *views = cell.contentView.subviews;
        for (UIView *tmp in views) {
            [tmp removeFromSuperview];
        }
        [cell.contentView addSubview:view];
        [self fillAllInSuperView:cell.contentView subView:view];
        return cell;
    } else  {
        if ([self.delegate respondsToSelector:@selector(tvObject:tableView:cellForRowAtIndexPath:)]) {
            return [self.delegate tvObject:self tableView:tableView cellForRowAtIndexPath:indexPath];
        } else {
            return nil;
        }
    }
    
    
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id data = [self itemWithIndexPath:indexPath];
    if ([data isKindOfClass:[UIView class]]) {
        UIView *view = data;
        return view.frame.size.height;
    } else {
        if ([self.delegate respondsToSelector:@selector(tvObject:tableView:heightForRowAtIndexPath:)]) {
            return [self.delegate tvObject:self tableView:tableView heightForRowAtIndexPath:indexPath];
        } else {
            return 0;
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    UIView *view = [self viewInHeaderSection:section];
    return view.frame.size.height;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [self viewInHeaderSection:section];
}

#pragma mark - Private
- (UIView *)viewInHeaderSection:(NSInteger)section
{
    id data = self.functionItems[section];
    if ([data isKindOfClass:[RXTVSectionItem class]]) {
        RXTVSectionItem *tmp = data;
        id data2 = tmp.data;
        if ([data2 isKindOfClass:[UIView class]]) {
            UIView *view = data2;
            return view;
        }
    }
    return [UIView new];
}



@end
