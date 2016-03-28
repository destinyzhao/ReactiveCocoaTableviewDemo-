//
//  RequestViewModel.h
//  ReactiveCocoaDemo
//
//  Created by Alex on 16/3/28.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RequestViewModel : NSObject

// 请求命令
@property (nonatomic, strong, readonly) RACCommand *reuqesCommand;

//模型数组
@property (nonatomic, strong, readonly) NSArray *models;

@end
