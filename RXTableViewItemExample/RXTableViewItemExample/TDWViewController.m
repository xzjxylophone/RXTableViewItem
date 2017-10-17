//
//  TDWViewController.m
//  RXTableViewItemExample
//
//  Created by ceshi on 17/4/5.
//  Copyright © 2017年 Rush.D.Xzj. All rights reserved.
//

#import "TDWViewController.h"
#import "RXTableViewItemHeader.h"

@interface TDWViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;


@property (nonatomic, strong) RXTVProtocolObject *rxtvProtocolObject;
@end

@implementation TDWViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.rxtvProtocolObject = [[RXTVProtocolObject alloc] init];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    
    
    
    self.tableView.delegate = self.rxtvProtocolObject;
    self.tableView.dataSource = self.rxtvProtocolObject;
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
