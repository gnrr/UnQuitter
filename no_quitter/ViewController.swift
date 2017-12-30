//
//  ViewController.swift
//  no_quitter
//
//  Created by g on 2017/12/30.
//  Copyright © 2017 g. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoadが呼ばれたぞ")
        
        // フォアグラウンドになったときに呼ばれるメソッドを登録
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.myEnterForeground),
            name: NSNotification.Name.UIApplicationWillEnterForeground,
            object: nil
        )
    }

    @objc func myEnterForeground(_ notification: Notification?) {
        if (self.isViewLoaded && (self.view.window != nil)) {
            print("フォアグラウンドになったぞ")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

