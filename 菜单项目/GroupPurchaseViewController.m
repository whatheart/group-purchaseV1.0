//
//  GroupPurchaseViewController.m
//  菜单项目
//
//  Created by tarena1 on 15/1/15.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import "GroupPurchaseViewController.h"
#import "MHTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FirstPageTableViewCell.h"
#import "UIKit+AFNetworking.h"
#import "Business.h"
#import "JsonParser.h"
#import "TRUtils.h"
#import "GroupPurchaseTableViewCell.h"
#import "GroupWebViewController.h"
#import "GroupSearchViewController.h"
#import "BusinessTableViewController.h"
#import "GroupSearch2ViewController.h"
@interface GroupPurchaseViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)MHTabBarController *tabbarController;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mySC;
@property (nonatomic, strong) NSDictionary *params;
@property(nonatomic,strong)NSMutableArray *bussiness;
@property(nonatomic,strong)NSArray *businessesArray;
@property(nonatomic,strong)NSString *selectedText;
@property(nonatomic,strong)NSMutableArray *selectBusinesses;
@property(nonatomic,strong)NSMutableArray *canBusinesses;
@end

@implementation GroupPurchaseViewController

- (IBAction)searchBarButtonClick:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"searchBarBtn" sender:sender];
}

- (void)changeCity:(NSNotification *)notification
{
    NSLog(@"%@", notification.userInfo);
    self.city = [notification.userInfo objectForKey:@"city"];
}

- (void)viewWillAppear:(BOOL)animated
{
    
    if (self.city == nil)
    {
        self.city = @"北京";
    }
    else
    {
        /* 改变城市 */
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeCity:) name:@"changeCity" object:nil];
    }
    
    //网络
    self.bussiness = [NSMutableArray array];
    self.canBusinesses = [NSMutableArray array];
    NSString *path = @"http://api.dianping.com/v1/business/find_businesses";
    
    NSDictionary *params = @{@"city":self.city};
    //添加签名
    path = [TRUtils serializeURL:path params:params];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        self.businessesArray = [dic objectForKey:@"businesses"];
        for (NSDictionary *dictionary in self.businessesArray)
        {
            Business *business = [JsonParser parseBusinessbyDic:dictionary];
            [self.bussiness addObject:business];
            [self.myTableView reloadData];
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
- (IBAction)searchBarBtnClick:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"searchJump2" sender:self.city];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.city == nil)
    {
        self.city = @"北京";
    }
    else
    {
        /* 改变城市 */
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeCity:) name:@"changeCity" object:nil];
    }
    
    //网络
    self.bussiness = [NSMutableArray array];
    self.canBusinesses = [NSMutableArray array];
    NSString *path = @"http://api.dianping.com/v1/business/find_businesses";
    
    NSDictionary *params = @{@"city":self.city};
    //添加签名
    path = [TRUtils serializeURL:path params:params];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        self.businessesArray = [dic objectForKey:@"businesses"];
        for (NSDictionary *dictionary in self.businessesArray)
        {
            Business *business = [JsonParser parseBusinessbyDic:dictionary];
            [self.bussiness addObject:business];
            [self.myTableView reloadData];
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    

    self.tabbarController = [[MHTabBarController alloc]init];
    self.tabbarController.delegate = self;
    
    FirstViewController *first = [[FirstViewController alloc]init];
    first.title = @"全部分类";
    SecondViewController *second = [[SecondViewController alloc]init];
    second.title = @"全部地区";
    ThirdViewController *third = [[ThirdViewController alloc]init];
    third.title = @"智能排序";
    
    self.tabbarController.viewControllers = @[first,second,third];
    [self.view addSubview:self.tabbarController.view];

    // Do any additional setup after loading the view.
}
-(void)subViewController:(UIViewController *)subViewController SelectedCell:(NSString *)selectedText
{
    self.selectedText = selectedText;
    //网络
    self.selectBusinesses = [NSMutableArray array];
    NSString *path = @"http://api.dianping.com/v1/business/find_businesses";
    
    NSDictionary *params = @{@"city":self.city,@"keyword":selectedText};
    //添加签名
    path = [TRUtils serializeURL:path params:params];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        self.businessesArray = [dic objectForKey:@"businesses"];
        for (NSDictionary *dictionary in self.businessesArray)
        {
            Business *business = [JsonParser parseBusinessbyDic:dictionary];
            [self.selectBusinesses addObject:business];
            [self.myTableView reloadData];
            
        }
        [self.myTableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//点击Cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"detailInfo" sender:self.bussiness[indexPath.row]];
}
//点击选择器做出相应的选择
- (IBAction)clickSV:(UISegmentedControl *)sender {
    //判断是不是有筛选条件
    //若有 更新的是selectBusinesses数组和它的有团购的数组
    //若无 更新的是businesses数组和它的有团购的数组
    if (self.selectedText)
    {
        if (sender.selectedSegmentIndex == 1)
        {
            for (Business *b in self.selectBusinesses)
            {
                if (b.has_deal == 1)
                {
                    [self.canBusinesses addObject:b];
                    [self.myTableView reloadData];
                }
            }
        }
        else
        {
            [self.myTableView reloadData];
        }
        
    }
    else
    {
        if (sender.selectedSegmentIndex == 1)
        {
            for (Business *b in self.bussiness)
            {
                if (b.has_deal == 1)
                {
                    [self.canBusinesses addObject:b];
                    [self.myTableView reloadData];
                }
            }
        }
        else
        {
            [self.myTableView reloadData];
        }
        
    }

}

//实现tableView里的方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //判断是否有筛选条件
    //若有 行数为selectBusinesses数组的元素个数或它的有团购数组元素个数
    //若没有 行数为businesses数组的元素个数或它的有团购数组元素个数
    if (self.selectedText)
    {
        if (self.mySC.selectedSegmentIndex == 0)
        {
            return self.selectBusinesses.count;
        }
        else
        {
            return self.canBusinesses.count;
        }
    }
    else
    {
        if (self.mySC.selectedSegmentIndex == 0)
        {
            return self.bussiness.count;
        }
        else
        {
            return self.canBusinesses.count;
        }
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GroupPurchaseTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //判断是否有筛选条件
    //若有 把selectBusinesses数组的元素或它的有团购数组元素传给cell
    //若没有 把businesses数组的元素或它的有团购数组元素传给cell
    if (self.selectedText)
    {
        if (self.mySC.selectedSegmentIndex == 0)
        {
            Business *b = self.selectBusinesses[indexPath.row];
            cell.business = b;
        }
        else
        {
            Business *b = self.canBusinesses[indexPath.row];
            cell.business = b;
        }
    }
    else
    {
        if (self.mySC.selectedSegmentIndex == 0)
        {
            Business *b = self.bussiness[indexPath.row];
            cell.business = b;
        }
        else
        {
            Business *b = self.canBusinesses[indexPath.row];
            cell.business = b;
        }
    }
    
    return cell;
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"detailInfo"]) {
        GroupWebViewController *wvc = segue.destinationViewController;
      wvc.business = sender;
        
    }
    else if ([segue.identifier isEqualToString:@"searchJump2"])
    {
        GroupSearch2ViewController *groupSearch2VC = segue.destinationViewController;
        groupSearch2VC.city = sender;
        
    }
}


@end
