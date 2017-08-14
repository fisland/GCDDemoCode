//
//  ViewController.m
//  GCDOCDemo_20170814
//
//  Created by Fisland_Z on 2017/8/14.
//  Copyright © 2017年 Zehuihong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //同步任务并行队列
    //[self syncQueueConcurrent];
    
    //同步任务串行队列
    //[self syncQueueSerial];
    
    
    //异步任务串行队列
    //[self asyncQueueSerial];
    
    //异步任务并行队列
    //[self asyncQueueConcurrent];
    
    
    //主线程同步任务
    //改进，塞入异步并行队列.
    ///*
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);//DISPATCH_QUEUE_CONCURRENT
    dispatch_async(queue, ^{
        [self syncQueueMain];
    });
    //*/
    
    //主线程异步任务
    //[self asyncQueueMain];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//同步任务并行队列
- (void)syncQueueConcurrent{
    NSLog(@"开始执行并行队列同步任务");
    NSLog(@"当前线程%@",[NSThread currentThread]);
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        NSLog(@"第一个任务当前的线程是%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"第二个任务当前的线程是%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"第三个任务当前的线程是%@",[NSThread currentThread]);
    });
    NSLog(@"结束执行任务");
}

//异步任务并行队列
- (void)asyncQueueConcurrent{
    NSLog(@"开始执行并行队列异步任务");
    NSLog(@"当前线程%@",[NSThread currentThread]);
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"第一个任务当前的线程是%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第二个任务当前的线程是%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第三个任务当前的线程是%@",[NSThread currentThread]);
    });
    NSLog(@"结束执行任务");
}

//同步任务串行队列
- (void)syncQueueSerial{
    NSLog(@"开始执行串行队列同步任务");
    NSLog(@"当前线程%@",[NSThread currentThread]);
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSLog(@"第一个任务当前的线程是%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"第二个任务当前的线程是%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"第三个任务当前的线程是%@",[NSThread currentThread]);
    });
    NSLog(@"结束执行任务");
}

//异步任务串行队列
- (void)asyncQueueSerial{
    NSLog(@"开始执行串行队列异步任务");
    NSLog(@"当前线程%@",[NSThread currentThread]);
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"第一个任务当前的线程是%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第二个任务当前的线程是%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第三个任务当前的线程是%@",[NSThread currentThread]);
    });
    NSLog(@"结束执行任务");
}

//主线程（特殊队列）
//主线程同步任务
- (void)syncQueueMain{
    NSLog(@"开始执行主线程队列同步任务");
    NSLog(@"当前线程%@",[NSThread currentThread]);
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        NSLog(@"第一个任务当前的线程是%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"第二个任务当前的线程是%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"第三个任务当前的线程是%@",[NSThread currentThread]);
    });
    NSLog(@"结束执行任务");
}
//主线程异步任务
- (void)asyncQueueMain{
    NSLog(@"开始执行主线程队列异步任务");
    NSLog(@"当前线程%@",[NSThread currentThread]);
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        NSLog(@"第一个任务当前的线程是%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第二个任务当前的线程是%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第三个任务当前的线程是%@",[NSThread currentThread]);
    });
    NSLog(@"结束执行任务");
}
@end
