//
//  RequestViewModel.m
//  ReactiveCocoaDemo
//
//  Created by Alex on 16/3/28.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "RequestViewModel.h"

@implementation RequestViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialBind];
        
    }
    return self;
}

- (void)initialBind
{
    _models = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23"];
    
    _reuqesCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        
        RACSignal *requsstSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:_models];
            [subscriber sendCompleted];
            return nil;
        }];
        return  requsstSignal;
    }];
}

@end
