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
    }
    
    @IBAction func dissmissSignUpView() {
        dismiss(animated: true, completion: nil)
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

