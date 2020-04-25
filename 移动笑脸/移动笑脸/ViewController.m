//
//  ViewController.m
//  移动笑脸
//
//  Created by 张安康 on 2019/9/25.
//  Copyright © 2019 zak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *img;
- (IBAction)run:(id)sender;
- (IBAction)rotate:(id)sender;
- (IBAction)scale:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)run:(id)sender {
    CGRect tmpframe=self.img.frame;
    NSInteger runtag=[sender tag];
    if (runtag==1) {
        tmpframe.origin.y-=10;
        self.img.frame=tmpframe;
    }else if(runtag==2){
        tmpframe.origin.x-=10;
        self.img.frame=tmpframe;
    }
    else if(runtag==3){
        tmpframe.origin.y+=10;
        self.img.frame=tmpframe;
    }
    else if(runtag==4){
        tmpframe.origin.x+=10;
        self.img.frame=tmpframe;
    }
}

- (IBAction)rotate:(id)sender {
   CGAffineTransform tmptransform= self.img.transform;
    NSInteger rotatetag=[sender tag];
    if(rotatetag == 5){
        self.img.transform = CGAffineTransformRotate(tmptransform, M_PI_4*-1);}
    else if (rotatetag == 6){
                self.img.transform = CGAffineTransformRotate(tmptransform, M_PI_4*1);}
    }

- (IBAction)scale:(id)sender {
    CGAffineTransform tmptransfom = self.img.transform;
    NSInteger scaletag = [sender tag];
    if (scaletag == 7) {
        self.img.transform = CGAffineTransformScale(tmptransfom, 1.2, 1.2);
    }
    else if (scaletag == 8){
        self.img.transform = CGAffineTransformScale(tmptransfom, 0.8, 0.8);
    }
}



@end
