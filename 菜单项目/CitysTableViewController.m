//
//  CitysTableViewController.m
//  菜单项目
//
//  Created by tarena1 on 15/1/15.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import "CitysTableViewController.h"

@interface CitysTableViewController ()<UISearchBarDelegate,UITabBarControllerDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;

//声明一个属性，用来保存查询结果
@property(nonatomic,strong)NSMutableArray *results;
//@property (nonatomic, strong)NSArray *arr;
@end

@implementation CitysTableViewController
//加上索引条
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    //声明一个数组，用来保存索引条上的显示内容
//    NSMutableArray *titles = [NSMutableArray array];
//    //    把索引条的数据添加到数据中
//    [titles addObject:UITableViewIndexSearch];
//    //    用for循环加入标签
//    for (int i = 'A'; i <='Z'; i++) {
//        [titles addObject:[NSString stringWithFormat:@"%c",i]];
//    }
//    //        返回数组对象
//    return titles;
    NSArray *a = @[@"定位",@"搜索",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"];
    return a;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSArray *a = @[@"定位",@"热点城市",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"];
    return [NSString stringWithFormat:@"%@",a[section]];
}
//设置索引的对应关系
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    if (index == 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"热门" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickSearch) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(30, 200, 20, 10) ;
        [self.tableView addSubview:button];
    }
    return index-1;
}
//搜索框button的点击事件方法实现
-(void)clickSearch{
    NSLog(@"开始到热门城市");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *pa = [[NSBundle mainBundle]pathForResource:@"cities" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:pa];
//    self.arr = array;
    self.citys = [NSMutableArray arrayWithArray:array];
    
    
    self.title = @"选择城市";
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    self.navigationItem.rightBarButtonItem = rightBarBtn;
//   设置导航栏颜色
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
 
    //    创建搜索显示器
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    searchBar.placeholder = @"城市名 拼音首字母 ...";
    self.tableView.tableHeaderView = searchBar;
    self.mySearchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    self.mySearchDisplayController.searchResultsDataSource = self;
    self.mySearchDisplayController.searchResultsDelegate = self;
//    解析城市代码
//    self.citys = [[NSMutableArray array]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cities" ofType:@".plist"]];
    
    
//    NSString *path =  @"http://api.dianping.com/v1/metadata/get_cities_with_coupons";
//    path = [TRUtils serializeURL:path params:nil];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        self.citys = [dictionary objectForKey:@"cities"];
//        [self.tableView reloadData];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//
//    }];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//取消按钮点击事件
- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return [self.citys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.citys[section];
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    NSArray *array = self.citys[indexPath.section];
    cell.textLabel.text = array[indexPath.row];
    /*
    if (tableView == self.tableView) {
        cell.textLabel.text = self.citys[indexPath.row];
    }else{
        cell.textLabel.text = self.results[indexPath.row];
    }
    */
    
    return cell;

 }
-(void)click1{
    NSLog(@"1111");
}
//传值
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.firstPageViewController.globalCity = self.citys[indexPath.section][indexPath.row];
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
