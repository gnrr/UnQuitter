//
//  ViewController.swift
//  no_quitter
//
//  Created by g on 2017/12/30.
//  Copyright © 2017 g. All rights reserved.
//

import UIKit

let BEGINNING = "2012/05/29 11:00:00"

class ViewController: UIViewController {
    @IBOutlet weak var label_beg: UILabel!
    @IBOutlet weak var label_now: UILabel!
    @IBOutlet weak var label_days: UILabel!
    
    private func update_result() {
        let f = DateFormatter()
        f.dateStyle = .medium
        f.timeStyle = .medium
        f.locale = Locale(identifier: "ja_JP")
        
        let beg = f.date(from: BEGINNING)!
        let now = Date()
        let diff = now.timeIntervalSince(beg as Date)
        
        // print(f.string(from: beg))
        // print(f.string(from: now))
        // print(diff)
        
        let days = Int(diff / (60 * 60 * 24));
        
        label_beg.text  = "Start: " + BEGINNING
        label_now.text  = "Now  : " + f.string(from: now)
        label_days.text = "Days : " + String(days)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
            // print("フォアグラウンドになったぞ")
            update_result()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        update_result()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
