//
//  ViewController.m
//  ReactiveCocoaDemo
//
//  Created by Alex on 16/3/10.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RequestViewModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) RequestViewModel *requestViewModel;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation ViewController

- (RequestViewModel *)requestViewModel
{
    if (_requestViewModel == nil) {
        _requestViewModel = [[RequestViewModel alloc]init];
    }
    return _requestViewModel;
}

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self bindWithViewModel];
}

- (void)bindWithViewModel
{
    RACSignal *requestSignal = [self.requestViewModel.reuqesCommand execute:nil];
    [requestSignal subscribeNext:^(id x) {
        [_dataArray addObjectsFromArray:x];
        [_tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.requestViewModel.models objectAtIndex:indexPath.row]];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
