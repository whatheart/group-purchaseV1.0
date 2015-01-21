//
//  GroupSearchViewController.m
//  菜单项目
//
//  Created by tarena1 on 15/1/17.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import "GroupSearch2ViewController.h"
#import "BusinessTableViewController.h"
#import "SearchViewController.h"
@interface GroupSearch2ViewController ()<UISearchBarDelegate, UISearchDisplayDelegate>
@property(nonatomic,strong)UISearchDisplayController *sdc;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *button;

@property (nonatomic, strong) NSArray *businessesArray;
@property (nonatomic, strong)NSMutableArray *businesses;
@property (nonatomic, copy)NSString *keyword;


@end

@implementation GroupSearch2ViewController
- (IBAction)click:(UIButton *)sender {
    UIButton *button = sender;
    if (button.tag == 0)
    {
        button.enabled = NO;
    }
    else
    {
        [self performSegueWithIdentifier:@"groupSearch2" sender:button];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    for (UIButton *button in self.button) {
        button.layer.borderWidth = 0.5;
        button.layer.borderColor = [[UIColor grayColor] CGColor];
        
    }
    self.businesses = [NSMutableArray array];
    
    self.businesses = [@[@"自助餐", @"酒店", @"电影", @"火锅", @"烤肉", @"KTV", @"运动健身", @"游泳",@"西餐", @"美容美体", @"日韩料理"] mutableCopy];
    
}
//让键盘下去
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.keyword = searchText;
}
//点击search
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
{
    [self performSegueWithIdentifier:@"groupSearch2" sender:self.keyword];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UIButton class]])
    {
        BusinessTableViewController *bvc = segue.destinationViewController;
        
        UIButton *button = sender;
        bvc.clickName =self.businesses[button.tag - 1];
        bvc.city = self.city;
    }
    else
    {
        BusinessTableViewController *bvc = segue.destinationViewController;
        
        bvc.clickName = sender;
        bvc.city = self.city;
    }
    
}


@end
