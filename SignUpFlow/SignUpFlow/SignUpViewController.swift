//
//  SecondViewController.swift
//  SignUpFlow
//
//  Created by sole on 2020/12/02.
//  textView Return 키,

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    @IBOutlet weak var introductionTextView: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        return picker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        idTextField.delegate = self
        passwordTextField.delegate = self
        checkPasswordTextField.delegate = self
        introductionTextView.delegate = self
        
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func dissmissSignUpView() {
        dismiss(animated: true, completion: nil)
    }
    
    func isFullFillTextView(introductionTextView :UITextView) {
        if introductionTextView.text == "" {
            nextButton.isEnabled = false
        }
    }
    
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func touchUpSelectImageButton(_ sender: UIButton) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image: UIImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            profileImage.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
}

extension SignUpViewController: UITextViewDelegate, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case idTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            checkPasswordTextField.becomeFirstResponder()
        case checkPasswordTextField:
            introductionTextView.becomeFirstResponder()
        default:
            break
        }
        return true
    }
}
