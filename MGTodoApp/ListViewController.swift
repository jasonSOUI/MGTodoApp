//
//  ListViewController.swift
//  MGTodoApp
//
//  Created by 黃俊傑 on 2018/7/12.
//  Copyright © 2018年 Soui. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var todoList = UserDefaults.standard.stringArray(forKey: "todoList") ?? [String]()
    
    @IBOutlet weak var listTableView: UITableView!
    
    // 隱藏狀態列
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.dataSource = self
        listTableView.delegate = self
        // Do any additional setup after loading the view.
        //        if let todoListData = UserDefaults.standard.stringArray(forKey: "todoList") {
        //            todoList = todoListData
        //        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell")
        cell?.textLabel?.text = todoList[indexPath.row]
        cell?.textLabel?.textColor = UIColor.black
        cell?.textLabel?.font = UIFont(name: "arial", size: 24)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoList.remove(at: indexPath.row)
            UserDefaults.standard.setValue(todoList, forKey: "todoList")
            listTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        if let tabBar = self.tabBarController {
            
            if let editController = tabBar.viewControllers?[1] as? EditController {
                
                if let inputText = editController.myInputText {
                    inputText.text = todoList[indexPath.row]
                }
                
                if let button = editController.myButton {
                    button.setTitle("OK", for: UIControlState.normal)
                }
                
                editController.isEdit = true
            }
            
            tabBar.selectedIndex = 1
        }
        
       
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
