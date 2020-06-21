//
//  EditViewController.swift
//  MemoApp
//
//  Created by 吉田 将人 on 2019/11/11.
//  Copyright © 2019 吉田 将人. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    
    var memo = String()
    var selectedRow = Int()
    var userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        textView.text = memo
        print(selectedRow)
        
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        
        if textView.text.isEmpty {
            print("空白です")
        } else {
            guard let editMemo = textView.text, !textView.text.isEmpty else { return }
            let TVC = self.presentingViewController as? TableViewController
            TVC?.memoArray[selectedRow] = editMemo
            userDefault.set(TVC?.memoArray, forKey: "memo")
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func deleteButton(_ sender: UIBarButtonItem) {
        if textView.text.isEmpty {
            print("空白です")
        } else {
        let alert = UIAlertController(title: "メモの削除", message: "削除しますか？", preferredStyle: UIAlertController.Style.alert)
        let delete = UIAlertAction(title: "削除", style: UIAlertAction.Style.default) { (action) in
            self.textView.text = ""
            let TVC = self.presentingViewController as? TableViewController
            TVC?.memoArray.remove(at: self.selectedRow)
            self.userDefault.set(TVC?.memoArray, forKey: "memo")
            print("delete")
        }
        let cancel = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel) { (action) in
            print("cancel")
        }
        
        alert.addAction(delete)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
