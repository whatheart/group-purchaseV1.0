//
//  WelcomeViewController.m
//  菜单项目
//
//  Created by tarena1 on 15/1/14.
//  Copyright (c) 2015年 tarena1. All rights reserved.
//

#import "WelcomeViewController.h"
#import "FIrstPageViewController.h"
@interface WelcomeViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

@end

@implementation WelcomeViewController
//加载图片懒加载

-(NSArray *)images{
    if (!_images) {
        _images = @[@"1.jpg",@"2.jpg",@"3.jpg"];
        
    }
    return _images;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0;  i <self.images.count; i ++) {
        UIImage *image = [UIImage imageNamed:self.images[i]];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
//        设置图片大小
        float x = self.view.frame.size.width*i;
        imageView.frame = CGRectMake(x, 0, self.view.frame.size.width, self.view.frame.size.height);
//       设置contextSize
        float width = self.view.frame.size.width *self.images.count;
        self.myScrollView.contentSize = CGSizeMake(width, self.view.frame.size.height);
//        设置整页翻
        self.myScrollView.pagingEnabled = YES;
        [self.myScrollView addSubview:imageView];
//        进行页面跳转
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width *(self.images.count - 1)+100, self.view.frame.size.height - 80, 120,50)];
        [button addTarget:self action:@selector(onclick) forControlEvents:UIControlEventTouchUpInside];

        [self.myScrollView addSubview:button];
    }
    // Do any additional setup after loading the view.
}
-(void)onclick{
    NSLog(@"跳转到主页");
    [self performSegueWithIdentifier:@"jumpTBC" sender:nil];
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
