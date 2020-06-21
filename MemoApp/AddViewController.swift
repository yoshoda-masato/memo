//
//  AddViewController.swift
//  MemoApp
//
//  Created by 吉田 将人 on 2019/11/11.
//  Copyright © 2019 吉田 将人. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    var addMemoArray = [String]()
    var userDefaults = UserDefaults.standard
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
//
//        guard let memo = textView.text, !textView.text.isEmpty else { return }
//        let TVC = self.presentingViewController as? TableViewController
//        TVC?.memoArray.append(memo)
//        dismiss(animated: true, completion: nil)
//
//        userDefaults.set(TVC?.memoArray, forKey: "memo")
        
        if textView.text.isEmpty {
            dismiss(animated: true, completion: nil)
        } else {
            guard let memo = textView.text, !textView.text.isEmpty else { return }
            let TVC = self.presentingViewController as? TableViewController
            TVC?.memoArray.append(memo)
            dismiss(animated: true, completion: nil)
            
            userDefaults.set(TVC?.memoArray, forKey: "memo")
 
        }
    }
    
    @IBAction func deleteButton(_ sender: UIBarButtonItem) {
        if textView.text.isEmpty {
            print("空白です")
        } else {
        let alert = UIAlertController(title: "メモの削除", message: "削除しますか？", preferredStyle: UIAlertController.Style.alert)
        let delete = UIAlertAction(title: "削除", style: UIAlertAction.Style.default) { (action) in
            self.textView.text = ""
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
