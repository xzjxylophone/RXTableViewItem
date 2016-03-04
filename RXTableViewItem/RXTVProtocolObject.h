//
//  RXTVProtocolObject.h
//  ZH
//
//  Created by Rush.D.Xzj on 16/3/2.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RXTVProtocolObject;

@protocol RXTVProtocolObjectDelegate <NSObject>



@optional
// dataSource
- (UITableViewCell *)tvObject:(RXTVProtocolObject *)tvObject tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


// delegate
- (CGFloat)tvObject:(RXTVProtocolObject *)tvObject tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)tvObject:(RXTVProtocolObject *)tvObject tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end



@interface RXTVProtocolObject : NSObject <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) NSArray *functionItems;

@property (nonatomic, weak) id<RXTVProtocolObjectDelegate> delegate;



#pragma mark - Public
- (NSArray *)sourceAryWithSection:(NSInteger)section;
- (id)itemWithIndexPath:(NSIndexPath *)indexPath;

@end
