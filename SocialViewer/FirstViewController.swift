//
//  FirstViewController.swift
//  SocialViewer
//
//  Created by 佐々木 健 on 2014/09/28.
//  Copyright (c) 2014年 ssk. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    // stroyboardでの操作
    // tabcontrollerを右クリックでnavigationcontrollerにつなげる
    // ctrl + ドラッグでrelationなんとかを選択
    // そうすると無限にタブが増やせる
    // navigationcontrollerがないとcellクリック->detail表示ができない(というかセグエの設定ができない)
    // 最初にFirstViewControllerをさくる
    
    
    // 変数作る -> Table View 設置 -> 右クリック -> Referencing OutletsをTableViewとつなげる -> 変数名を選択する
    // or Table View -> Ctrlで接続 -> Table View 右クリックで確認する
    @IBOutlet var table : UITableView?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // セグエの処理
    // セグエの名前(identifier)をつけて呼び出す
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("hoge")
        if segue.identifier == "showTableDetail" {
            
            if let indexPath = self.table!.indexPathForSelectedRow() {
                
                var sendText : String = "セクション\(indexPath.section)の\(indexPath.row)行目"
                var nextViewController : FirstViewDetailController = segue.destinationViewController as FirstViewDetailController
                nextViewController.firstDetailItem = sendText
            }
        }
        
    }

    
    // 以下UITableViewDelegateの動作
    
    // section
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 5
    }
    
    // 行override 数
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    
    // 表示するセル
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellIdentifier : String = "cell"
        // cellの準備
        var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }
        
        // 表示する文字
        var title : String = "セクション\(indexPath.section)の\(indexPath.row)行目"
        
        // セルのラベルに設定する
        cell!.textLabel!.text = title;
        
        return cell!
    }
    
    // 選択された時に行う処理
    // ここでperformSegueWithIdentifierを呼び出してidentifierを設定したsegueの名前と一致させて呼び出す
    // ちなみにprepareForSegueを呼び出すだけだと動かない......
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) -> Void{
        println("セクション\(indexPath.section)の\(indexPath.row)行目")
        
        self.performSegueWithIdentifier("showFirstDetail", sender: self)
        //[self performSegueWithIdentifier:@"toViewController" sender:self];
    }
    
    // ステータスバー非表示
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
}

