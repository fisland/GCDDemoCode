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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //串行队列同步任务
    func syncQueueSerial() {
        let queue = DispatchQueue(label: "test")
        queue.sync {
            print("第一个任务当前的线程是")
        }
    }
    
    //串行队列异步任务
    func asyncQueueSerial() {
        
    }
    
    //并行队列同步任务
    func syncQueueConcurrent() {
        
    }
    
    //并行队列异步任务
    func asyncQueueConcurrent() {
        
    }
    
    //主线程同步任务
    func syncQueueMain() {
        
    }
    
    //主线程异步任务
    func asyncQueueMain() {
        
    }
}

