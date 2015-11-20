//
//  MainViewController.m
//  RXTableViewItemExample
//
//  Created by Rush.D.Xzj on 15/11/20.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "MainViewController.h"
#import "RXTableViewItemHeader.h"
#import "TestCell.h"
@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, strong) NSArray *functionItems;


@end

@implementation MainViewController






#pragma mark - UITableViewDataSource
#pragma mark Required
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.functionItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = self.functionItems[indexPath.row];
    NSString *identify = [TestCell identifier];
    TestCell *cell = (TestCell *)[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [TestCell cell_xib];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell setData:item];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [TestCell cellHeight];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RXFunctionItem *item = self.functionItems[indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (item.action != nil) {
        [self performSelector:item.action withObject:item afterDelay:0];
    }
}

#pragma mark - Action
- (void)cell0Action:(id)sender
{
    NSLog(@"cell0Action:%@", sender);
}

- (void)cell1Action:(id)sender
{
    NSLog(@"cell1Action:%@", sender);
}
- (void)cell2Action:(id)sender
{
    NSLog(@"cell2Action:%@", sender);
}


#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    RXFunctionItem *item0 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"第1行" action:@selector(cell0Action:) type:0 object:nil];
    RXFunctionItem *item1 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"第2行" action:@selector(cell1Action:) type:0 object:nil];
    RXFunctionItem *item2 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"第3行" action:@selector(cell2Action:) type:0 object:nil];
    
    self.functionItems = @[item0, item1, item2];
    
    [self.tableView reloadData];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
