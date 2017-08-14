//
//  ViewController.swift
//  GCDSwiftDemo_20170814
//
//  Created by Fisland_Z on 2017/8/14.
//  Copyright © 2017年 Zehuihong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //syncQueueSerial()
        //asyncQueueSerial()
        
        //syncQueueConcurrent()
        
//        asyncQueueConcurrent()
        print("当前主线程\(Thread.current)")

        DispatchQueue.global().async {
            self.syncQueueMain()
        }
        
//        asyncQueueMain()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //串行队列同步任务
    func syncQueueSerial() {
        let queue = DispatchQueue(label: "test")
        print("当前线程\(Thread.current)")
        queue.sync {
            for i in 1...3{
                print("第\(i)个任务当前的线程是\(Thread.current)")
            }
        }
        print("执行结束")
    }
    
    //串行队列异步任务
    func asyncQueueSerial() {
        let queue = DispatchQueue(label: "test")
        print("当前线程\(Thread.current)")
        queue.async {
            for i in 1...3{
                print("第\(i)个任务当前的线程是\(Thread.current)")
            }
        }
        print("执行结束")
    }
    
    //并行队列同步任务
    func syncQueueConcurrent() {
        let queue = DispatchQueue(label: "test", qos: .default, attributes: .concurrent, autoreleaseFrequency: .workItem, target: nil)
        print("当前线程\(Thread.current)")
        queue.sync {
            for i in 1...3{
                print("第\(i)个任务当前的线程是\(Thread.current)")
            }
        }
        print("执行结束")
    }
    
    //并行队列异步任务
    func asyncQueueConcurrent() {
        let queue = DispatchQueue(label: "test", qos: .utility, attributes: .concurrent, autoreleaseFrequency: .workItem, target: nil)
        print("当前线程\(Thread.current)")
        queue.async {
            print("第1个任务当前的线程是\(Thread.current)")
        }
        queue.async {
            print("第2个任务当前的线程是\(Thread.current)")
        }

        queue.async {
            print("第3个任务当前的线程是\(Thread.current)")
        }

        print("执行结束")
    }
    
    //主线程同步任务
    func syncQueueMain() {
        print("当前线程\(Thread.current)")
        DispatchQueue.main.sync {
            print("在主队列执行任务1\(Thread.current)")
        }
        DispatchQueue.main.sync {
            print("在主队列执行任务2\(Thread.current)")
        }
        DispatchQueue.main.sync {
            print("在主队列执行任务3\(Thread.current)")
        }
    }
    
    //主线程异步任务
    func asyncQueueMain() {
        print("当前线程\(Thread.current)")
        DispatchQueue.main.async {
            print("在主队列执行任务1\(Thread.current)")
        }
        DispatchQueue.main.async {
            print("在主队列执行任务2\(Thread.current)")
        }
        DispatchQueue.main.async {
            print("在主队列执行任务3\(Thread.current)")
        }
    }
}

