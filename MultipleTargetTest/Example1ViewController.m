//
//  Example1ViewController.m
//  MultipleTargetTest
//
//  Created by 晓童 韩 on 16/6/17.
//  Copyright © 2016年 晓童 韩. All rights reserved.
//

#import "Example1ViewController.h"

@interface Example1ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation Example1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

#pragma mark - MULTIPLE_TARGETS_TARGET2
#ifdef MULTIPLE_TARGETS_TARGET2
    self.titleLabel.text = @"Target2 Example";
#endif
    
    
}

@end

