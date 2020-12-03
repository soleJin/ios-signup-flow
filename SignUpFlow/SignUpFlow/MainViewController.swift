//
//  SignUpFlow - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var statusMessageLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        changeLabelText(statusLabel: statusMessageLabel, message: .empty)
        
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
        }
        return false
    }
    
    func changeLabelText(statusLabel: UILabel, message: Message) {
        statusLabel.text = message.rawValue
    }
    
    func isfullfill(textField: UITextField...) -> Bool {
        for text in textField {
            guard text.text != "" else {
                return false
            }
        }
        return true
    }
    
    @IBAction func touchUpSignIn(_ sender: UIButton) {
        guard isfullfill(textField: idTextField) else {
            changeLabelText(statusLabel: statusMessageLabel, message: .enterID)
            return
        }
        guard isfullfill(textField: passwordTextField) else {
            changeLabelText(statusLabel: statusMessageLabel, message: .enterPassword)
            return
        }
        changeLabelText(statusLabel: statusMessageLabel, message: .disableSignIn)
    }
}

