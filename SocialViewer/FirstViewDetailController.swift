//
//  FirstViewDetailControllert.swift
//  SocialViewer
//
//  Created by 佐々木 健 on 2014/09/28.
//  Copyright (c) 2014年 ssk. All rights reserved.
//

import UIKit

class FirstViewDetailController: UIViewController{
    
    @IBOutlet weak var label : UILabel!
    
    var firstDetailItem: AnyObject? {
        didSet{
            // Update the view.
            self.configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.firstDetailItem {
            label.text = (firstDetailItem as String)
//            if let labelText = self.label {
//                label.text = firstDetailItem!.detail
//            }
        }
    }
}

