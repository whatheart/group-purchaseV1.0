//
//  BusinessTableViewController.m
//  菜单项目
//
//  Created by Aga on 15/1/15.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import "BusinessTableViewController.h"
#import "WebViewViewController.h"
@interface BusinessTableViewController ()
//@property (nonatomic, strong) NSArray *businessesArray;
@property (nonatomic, strong) NSMutableArray *businesses;
@property (nonatomic, copy) NSString *name;

@end

@implementation BusinessTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.businesses = [NSMutableArray array];
    self.title = self.clickName;
    /* Search business by keyword */
    NSString *path = @"http://api.dianping.com/v1/business/find_businesses";
    NSLog(@"%@, %@", self.city, self.clickName);
    NSDictionary *parameters = @{@"city":self.city, @"keyword":self.clickName};
    path = [TRUtils serializeURL:path params:parameters];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSLog(@"%@", dictionary);
        NSArray *businessesArray = [dictionary objectForKey:@"businesses"];
        for (NSDictionary *businessDictionary in businessesArray)
        {
            Business *keywordBusiness = [JsonParser parseBusinessbyDic:businessDictionary];
            [self.businesses addObject:keywordBusiness];
            [self.tableView reloadData];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.businesses.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
       cell.business= self.businesses[indexPath.row];
        return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showBusinessURL" sender:indexPath];
}

 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     WebViewViewController *webViewController = segue.destinationViewController;
     NSIndexPath *indexPath = sender;
     Business *business = self.businesses[indexPath.row];
     webViewController.webUrl = business.business_url;
     webViewController.businessName = business.name;
//     隐藏tabBar
     webViewController.hidesBottomBarWhenPushed = YES;
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


@end
