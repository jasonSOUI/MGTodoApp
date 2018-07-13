//
//  EditController.swift
//  MGTodoApp
//
//  Created by 黃俊傑 on 2018/7/12.
//  Copyright © 2018年 Soui. All rights reserved.
//

import UIKit

class EditController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var myInputText: UITextField!
    
    var isEdit: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myInputText.becomeFirstResponder()
        myInputText.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func doSubmitAction(_ sender: UIButton) {
        
        if let text = myInputText.text {
            if(text != "") {
                if let listViewController = self.tabBarController?.viewControllers?[0] as? ListViewController {
                    listViewController.todoList.append(text)
                    listViewController.listTableView.reloadData()
                    myInputText.text = ""
                    myButton.setTitle("Back", for: UIControlState.normal)
                    UserDefaults.standard.setValue(listViewController.todoList, forKey: "todoList")
                }
            }
        }
        
        
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func onInputTextChange(_ sender: UITextField) {
        if let text = sender.text {
            changeText(text: text)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            changeText(text: text)
        }
        return true
    }
    
    func changeText(text: String) {
        if text  != "" {
            myButton.setTitle("OK", for: UIControlState.normal)
        } else {
            myButton.setTitle("Back", for: UIControlState.normal)
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
