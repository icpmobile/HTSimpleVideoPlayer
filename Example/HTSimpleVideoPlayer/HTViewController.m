//
//  HTViewController.m
//  HTSimpleVideoPlayer
//
//  Created by JamesLiAndroid on 07/04/2019.
//  Copyright (c) 2019 JamesLiAndroid. All rights reserved.
//

#import "HTViewController.h"
#import "TBPlayer.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface HTViewController ()

@property (nonatomic, copy) NSString *videoUrl;

@property (nonatomic, strong) TBPlayer *player;
@property (nonatomic, strong) UIView *showView;
@property (nonatomic, strong) UIButton *btnBack;

@end

@implementation HTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = @"视频播放";
    
    _videoUrl = @"http://v4ttyey-10001453.video.myqcloud.com/Microblog/288-4-1452304375video1466172731.mp4";
    
    self.showView = [[UIView alloc] init];
    self.showView.backgroundColor = [UIColor lightGrayColor];
    self.showView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64);
    [self.view addSubview:self.showView];
    
    self.btnBack = [[UIButton alloc] init];
    [self.btnBack setTitle:@"关闭" forState:UIControlStateNormal];
    [self.btnBack setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.btnBack.backgroundColor = [UIColor cyanColor];
    [self.btnBack addTarget:self action:@selector(btnBackToFront:) forControlEvents:UIControlEventTouchUpInside];
    self.btnBack.frame = CGRectMake(kScreenWidth / 2 - 50, kScreenHeight - 40, 100, 30);
    [self.view addSubview:self.btnBack];
    
    
    if (![@"" isEqualToString:_videoUrl]) {
        NSURL *vURL = [NSURL URLWithString:_videoUrl];
        [[TBPlayer sharedInstance] playWithUrl:vURL showView:self.showView];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) btnBackToFront:(UIButton *) btn {
    // [[TBPlayer sharedInstance] stop];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}


@end
