//
//  ViewController.m
//  MultipleTargetTest
//
//  Created by 晓童 韩 on 16/6/17.
//  Copyright © 2016年 晓童 韩. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#ifdef MULTIPLE_TARGETS_TARGET2
#import "Target_2-Swift.h"
#else
#import "MultipleTargetTest-Swift.h"
#endif

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableview = ({
        UITableView *tableview = [UITableView new];
        [self.view addSubview:tableview];
        [tableview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        tableview.delegate = self;
        tableview.dataSource = self;
        
        tableview;
    });
    
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Example%@",@(indexPath.row+1)];
    
    return cell;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class cls = NSClassFromString([NSString stringWithFormat:@"Example%@ViewController", @(indexPath.row+1)] );
    
    if (cls) {
        [self.navigationController pushViewController:[cls new] animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
