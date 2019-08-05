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
    
    
    // 施行数
    var answerCount: Int = 0
    
  
   
    
    
    // ---------------------------------------------------------------------------------------------------
    // 【済】数値を入力して決定を行なったあと、答えの数と照らし合わせて「上か下か」判別がつくメッセージを表示させる。
    // 【済】答えを当てた場合、再度ランダムな数値が割り当てられて継続して遊べること。
    // 入力内容のバリデーション（入力値チェック）を行う。（1〜100以外の入力をエラーとする）
    // 遊んだ履歴を「UITextView」を用いて表示する。
    
    
    
    
    // Storyboardの情報を読み込み終わった後に呼ばれるやつ
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 【TextField の入力制限】について。 Int のみ入力可。
    // コピペした。意味は不明。とりあえずこれで。
    // Int 以外を入れると壊れるんだけど。まじおこ。
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let currentString = textField.text, let _range = Range(range, in: currentString) {
            let newString = currentString.replacingCharacters(in: _range, with: string)
            return Int(newString) != nil
        } else {
            return false
        }
    }

    
    
    // この辺から関数とか書き始めればいいんじゃないかなぁ
    
    // ここ【正解】のエリアね。
    // 正解の数字を 1~100 の中からランダムに生成
    var correctNum = Int.random(in: 1...100)    // 最初場所わかんなくていろいろ試したけど、ここで良いっぽい。多分。理解した。
    
    
    
    // 【決定ボタン押した後の処理】をここに書くよ。
    // 回答をチェックする関数
    func checkAnswer() {
        
        // 1. ラベルを入力したテキストに変更する
        numLabel.text = numTextField.text
        
        // 2. TextField内の数値をInt型で取り出す
        let answerNum = Int(numTextField.text!)!    // Intつけないと、下の if answerNum < correctNum { で怒られる。var だと警告がでる。
        
        // 3. 正解と照らし合わせて「上か下か」判別がつくメッセージを表示させる
        if answerNum < correctNum {
            // 3-1. 正解よりも低い場合
            answerCount += 1    // 施行数を1増やす
            showAlert(message: "答えは\(answerNum)より高い値です。")    // アラートを表示させたい → アラートの関数を下に作ってきた！
            
            
        } else if answerNum > correctNum {
            // 3-2. 正解よりも高い場合
            answerCount += 1
            showAlert(message: "答えは\(answerNum)より低い値です。")
            
            
        } else if answerNum == correctNum {
            // 3-3. 正解と一致した場合
            answerCount += 1    // 施行数を1増やす
            showAlert(message: "\(answerCount)回目に正解しました！ 数字をリセットしました！")    // アラート表示
            
            // リセットしていくよ〜
            answerCount = 0
            correctNum = Int.random(in: 1...100)    // できたああああああああああああ！！！！！
                                                    // correctNum を定数にしていたのが原因でエラーがでていた。変数にして解決。
            
            
        } else {
            // エラーをわかりやすくする
            print("エラー")
            return
        }
    }
    
    
    
    //【アラート】について書くよ。
    // コピペした。あまり理解していない。後で確認。
    // よくわかんないけど 「(message: String)の内容をそのままアラートに表示させる」 って言ってるみたい。
    // だから、 showAlert(message: "表示させたい内容") でおけ。
    // 上の checkAnswer の中で使うよ〜
    func showAlert(message: String) {
        // アラートの作成
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        // アラートのアクション（ボタン部分の定義）
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        // 作成した alert に閉じるボタンを追加
        alert.addAction(close)
        // アラートを表示する
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    // Action 紐付け
    // 決定ボタンが押された時
    @IBAction func resultButton(_ sender: Any) {    // 最初ここに色々処理書こうとしたけど上に関数作るっぽい。そのほうがイケてるからかな？
        checkAnswer()    // checkAnswer 発動！ 上に checkAnswer関数作るよ〜
    }
}


