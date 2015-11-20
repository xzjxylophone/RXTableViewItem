# RXTableViewItem


TestCell
```objective-c
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
```
VC:
```objective-c
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
```



