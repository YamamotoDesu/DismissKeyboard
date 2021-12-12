//
//  ViewController.swift
//  DismissKeyboard
//
//  Created by 山本響 on 2021/12/12.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var text1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text1.delegate = self

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        text1.resignFirstResponder()
        
        return true
    }
}

