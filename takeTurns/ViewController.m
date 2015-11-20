//
//  ViewController.m
//  takeTurns
//
//  Created by wordoor－z on 15/11/18.
//  Copyright © 2015年 wordoor－z. All rights reserved.
//

#import "ViewController.h"
#import "WZXtakeTurns.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WZXtakeTurns *wzx=[[WZXtakeTurns alloc]initWithFrame:self.view.bounds];
    [wzx addImg:[UIImage imageNamed:@"start_page1.png"]];
    [wzx addImg:[UIImage imageNamed:@"start_page2.png"]];
    [wzx addImg:[UIImage imageNamed:@"start_page3.png"]];
    [wzx addPageframe:CGRectMake(0, 500, self.view.frame.size.width, 20) andType:1];
    [self.view addSubview:wzx];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
