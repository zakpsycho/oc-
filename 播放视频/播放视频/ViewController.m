//
//  ViewController.m
//  播放视频
//
//  Created by 张安康 on 2020/5/29.
//  Copyright © 2020 张安康康康康. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface ViewController ()
@property(nonatomic,strong)AVPlayerViewController *playerViewController;
@property(nonatomic,strong)AVPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.playerViewController = [[AVPlayerViewController alloc] init];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"yxhb" ofType:@"mp4"];
    
    NSURL *url = [NSURL fileURLWithPath:path];
    
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:url];
    
    self.player = [[AVPlayer alloc] initWithPlayerItem:item];
    
    self.playerViewController.player = self.player;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self presentViewController:self.playerViewController animated:YES completion:^{
        [self.player play];
    }];
}

@end
