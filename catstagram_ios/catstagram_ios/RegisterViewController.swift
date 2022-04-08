//
//  RegisterViewController.swift
//  catstagram_ios
//
//  Created by Euna Ahn on 2022/04/01.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    // 유효성 검사를 위한 프로퍼티
    var isValidEmail = false

    var isValidName = false
    
    var isValidNickName = false
    
    var isValidPassword = false
    
    // Textfields
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var textFields: [UITextField]{
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }
    
    // MARK: - Actions
    @objc
    func textFieldEditingChanged(_ sender: UITextField){
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            print("email")

        case nameTextField:
            print("name")

        case nicknameTextField:
            print("nickname")

        case passwordTextField:
            print("password")
            
        default:
            fatalError("Missing TextField...")
        }
    }
    
    
    
    
    // MARK: - Helpers
    private func setupTextField(){
        
        textFields.forEach{ tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
            
        }
        
        
    }

}

// 정규표현식

extension String{
    func isVaildPassword() -> Bool {
        let
    }
}
