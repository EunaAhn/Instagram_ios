//
//  LoginViewController.swift
//  catstagram_ios
//
//  Created by Euna Ahn on 2022/04/01.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    var email = String()
    var password = String()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        // 옵셔널
        // 값이 있을수도 없을수도
        let text = sender.text ?? ""
        self.email = text

    }
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        //화면전환
        // 1. 스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. 뷰컨트롤러 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        // 3. 화면전환 메소드를 이용해서 화면을 전환
//        self.present(registerViewController, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
    }
}
