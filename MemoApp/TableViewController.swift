//
//  TableViewController.swift
//  MemoApp
//
//  Created by 吉田 将人 on 2019/11/11.
//  Copyright © 2019 吉田 将人. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var memoArray = [String]()
    var userDefaults = UserDefaults.standard

    @IBOutlet weak var navigationBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.title = "title"
        navigationItem.leftBarButtonItem = editButtonItem
        
        guard let getArray = userDefaults.array(forKey: "memo") as? [String], !userDefaults.array(forKey: "memo")!.isEmpty else { return }
        memoArray = getArray
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        tableView.isEditing = editing
    }
    
    override func viewWillAppear(_ animated: Bool) {

        self.tableView.reloadData()
        
    }
    
    func viewDidAppear() {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memoArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memo", for: indexPath)
        cell.textLabel!.text = memoArray[indexPath.row]
        return cell
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let AVC = self.presentingViewController as? AddViewController
        AVC?.addMemoArray = memoArray
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "memoDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "memoDetail" {
            let EVC = segue.destination as? EditViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow
            EVC!.memo = memoArray[selectedIndexPath!.row]
            EVC!.selectedRow = selectedIndexPath!.row
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            memoArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            userDefaults.set(memoArray, forKey: "memo")
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
