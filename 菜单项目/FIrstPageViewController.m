//
//  FIrstPageViewController.m
//  菜单项目
//
//  Created by tarena1 on 15/1/14.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import "FIrstPageViewController.h"
#import "FirstPageTableViewCell.h"
#import "CitysTableViewController.h"
#import "BusinessTableViewController.h"
#import "WebViewViewController.h"
#import "GroupSearchViewController.h"
@interface FIrstPageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *leftBarButtonItem;
//声明一个数组，用来解析图片
@property(nonatomic,strong)NSMutableArray *firstPageBusiness;
@end

@implementation FIrstPageViewController

- (IBAction)leftBarcitySelected:(UIBarButtonItem*)sender {
    CitysTableViewController *citysTableViewController = [[CitysTableViewController alloc]init];
    citysTableViewController.firstPageViewController = self;
    UINavigationController *nac = [[UINavigationController alloc]initWithRootViewController:citysTableViewController];
    [self presentViewController:nac animated:YES completion:nil];
}
//判断tabBar上的地区
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.globalCity == nil)
    {
        self.leftBarButtonItem.title = @"北京";
        self.globalCity = @"北京";
    }
    else
    {
        self.leftBarButtonItem.title = self.globalCity;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeCity" object:nil userInfo:@{@"city":self.globalCity}];
    }
    
    

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //    解析图片，显示在tabelView中
    self.firstPageBusiness = [NSMutableArray array];
    NSString *path =  @"http://api.dianping.com/v1/coupon/find_coupons";
    NSDictionary *parameters = @{@"city":self.globalCity};
    path = [TRUtils serializeURL:path params:parameters];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *couponsArray = [dictionary objectForKey:@"coupons"];
        for (NSDictionary *couponsDictionary in couponsArray) {
            FirstPageBusiness *firstBusiness = [JsonParser parserKeywordBusinessByDictionary:couponsDictionary];
            [self.firstPageBusiness addObject:firstBusiness];
            [self.myTableView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
}
//button点击事件
- (IBAction)viewClick:(UIButton *)sender
{
    switch (sender.tag)
    {
        case 0:[self performSegueWithIdentifier:@"showBusiness" sender:sender]; break;
        case 1:[self performSegueWithIdentifier:@"showBusiness" sender:sender]; break;
        case 2:[self performSegueWithIdentifier:@"showBusiness" sender:sender]; break;
        case 3:[self performSegueWithIdentifier:@"showBusiness" sender:sender]; break;
        case 4:[self performSegueWithIdentifier:@"showBusiness" sender:sender]; break;
        case 5:[self performSegueWithIdentifier:@"showBusiness" sender:sender]; break;
        case 6:[self performSegueWithIdentifier:@"showBusiness" sender:sender]; break;
        case 7:[self performSegueWithIdentifier:@"showBusiness" sender:sender]; break;
    }
}
#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{  if ([sender isKindOfClass:[UIButton class]])
{
    BusinessTableViewController *btvc = segue.destinationViewController;
    UIButton *button = sender;
    btvc.city = self.globalCity;
    switch (button.tag)
    {
            
        case 0:
        {
            btvc.clickName = @"美食";
        }
        break;
            
        case 1:
        {
            btvc.clickName = @"电影";
        }
            break;
        case 2:
        {
            btvc.clickName = @"酒店";
        }
            break;
        case 3:
        {
            btvc.clickName = @"KTV";
        }
            break;
        case 4:
        {
            btvc.clickName = @"小吃";
        }
            break;
        case 5:
        {
            btvc.clickName = @"休闲娱乐";
        }
            break;
        case 6:
        {
            btvc.clickName = @"西餐";
        }
            break;
        case 7:
        {
            btvc.clickName = @"更多";
        }
            break;

    }
}
else if ([segue.identifier isEqualToString:@"searchJump"])
{
    GroupSearchViewController *groupSearchVC = segue.destinationViewController;
    groupSearchVC.city = self.globalCity;
}
else{
    WebViewViewController *webViewController = segue.destinationViewController;
    NSIndexPath *indexPath = sender;
    FirstPageBusiness *business = self.firstPageBusiness[indexPath.row];
    webViewController.webUrl = business.bussiness_url;
    webViewController.businessName = business.title;
    //     隐藏tabBar
    webViewController.hidesBottomBarWhenPushed = YES;
}
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    在左边添加两个按钮
    UIBarButtonItem *bar1 = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"首页_06.png" ] style:UIBarButtonItemStyleDone target:self action:@selector(click)];
    bar1.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItems = @[self.leftBarButtonItem, bar1];

//     在中间设置按钮，用于搜索
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 170, 22)];
    [button setImage:[UIImage imageNamed:@"首页0_03"] forState:UIControlStateNormal];

    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];

    self.navigationItem.titleView = button;
// 设置导航栏按钮
    [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
      // Do any additional setup after loading the view.
}
//点击这个按钮，进行搜索城市
-(void)click{
    //NSLog(@"zhixignle");
    //CitysTableViewController *tvc = [self.storyboard instantiateViewControllerWithIdentifier:@"citys"];
      //[self.navigationController pushViewController:tvc animated:YES];
}
-(void)buttonAction{
    NSLog(@"搜索商家，品类，商圈");
    
    [self performSegueWithIdentifier:@"searchJump" sender:nil];
//    GroupSearchViewController *GSVC =[self.storyboard  instantiateViewControllerWithIdentifier:@"searchVC"];
//    [self.navigationController presentViewController:GSVC animated:YES completion:nil];
}
//设置tabelView的方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.firstPageBusiness.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FirstPageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.firstPageBusiness = self.firstPageBusiness[indexPath.row];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"pushWeb" sender:indexPath];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
