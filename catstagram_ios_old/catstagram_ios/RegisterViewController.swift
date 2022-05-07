//
//  RegisterViewController.swift
//  catstagram_ios
//
//  Created by Euna Ahn on 2022/04/01.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    
    var email: String = ""
    var name: String = ""
    var nickName: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    

    // 유효성 검사를 위한 프로퍼티
    var isValidEmail = false {
        didSet{ //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }

    var isValidName = false {
        didSet{ //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidNickName = false {
        didSet{ //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false {
        didSet{ //프로퍼티 옵저버
            self.validateUserInfo()
        }
    }
    

    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var popToLoginButton: UIButton!
    
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
        setupAttribute()
        
        //bug fix
        self.navigationController?
            .interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: - Actions
    @objc
    func textFieldEditingChanged(_ sender: UITextField){
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text

        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text

        case nicknameTextField:
            self.isValidNickName = text.count > 2
            self.nickName = text

        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
            
        default:
            fatalError("Missing TextField...")
        }
    }
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        //뒤로 가기
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBAction func registerButtonDidTapped(_ sender: UIButton) {
        //뒤로 가기
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(
            email: self.email,
            name: self.name,
            nickname: self.nickName,
            password: self.password)
        
        self.userInfo?(userInfo)
    }
    
    // MARK: - Helpers
    private func setupTextField(){
        
        textFields.forEach{ tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
            
        }
        
    }
    
    //사용자가 입력한 회원 정보를 확인하고 -> UI 업데이트
    private func validateUserInfo(){
        
        print("result : \(isValidEmail),\(isValidName),\(isValidNickName),\(isValidPassword)")
        
        if isValidEmail
            && isValidName
            && isValidNickName
            && isValidPassword{
            
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.facebookColor
            }
        } else{
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = .disabledButtonColor
            }
        }
    }
    
    private func setupAttribute() {
            // register button 글자별 색상 변경
            
            let text1 = "계정이 있으신가요?"
            let text2 = "로그인"
            
            let font1 = UIFont.systemFont(ofSize: 13)
            let font2 = UIFont.boldSystemFont(ofSize: 13)
            
            let color1 = UIColor.darkGray
            let color2 = UIColor.facebookColor
            
            let attributes = generateButtonAttribute(
                self.popToLoginButton,
                texts: text1, text2,
                fonts: font1, font2,
                colors: color1, color2)
            
            self.popToLoginButton.setAttributedTitle(attributes, for: .normal) // 버튼의 일반적인 상태에서 적용한다는 뜻
            
        }

}

// 정규표현식

// 정규표현식
extension String {
    
    func isValidPassword() -> Bool {
        // 대문자 , 소문자, 특수문자, 숫자 8자 이상일 때 True
        let regularExpression  = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[\\d])(?=.*[~!@#\\$%\\^&\\*])[\\w~!@#\\$%\\^&\\*]{8,}$"

        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    
    func isValidEmail() -> Bool {
        // @ 2글자 이상
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }
    
}
