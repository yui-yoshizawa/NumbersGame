//
//  ViewController.swift
//  NumbersGame
//
//  Created by 吉澤優衣 on 2019/08/05.
//  Copyright © 2019 吉澤優衣. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Outlet 紐付け
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var numLabel: UILabel!
    
    @IBOutlet weak var numTextField: UITextField!
    
    @IBOutlet weak var resultButton: UIButton!    // 必要？
    
    @IBOutlet weak var resultTextView: UITextView!
    
    
    
    
    
    
    
    override func viewDidLoad() {    // Storyboardの情報を読み込み終わった後に呼ばれる
        super.viewDidLoad()
        
    }
    
    // Action 紐付け
    // 決定ボタンが押された時
    @IBAction func resultButton(_ sender: Any) {
        numLabel.text = numTextField.text
    }
    

}

