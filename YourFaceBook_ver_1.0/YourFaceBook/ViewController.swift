//
//  ViewController.swift
//  YourFaceBook
//
//  Created by Chunsu Kim on 17/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

@IBDesignable
class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - User information
    let users: [User] = [
    User(name: "김도영", password: "1234"),
    User(name: "이정진", password: "abcd")
    ]
    
    // MARK: - Properties
    var signinButton = UIButton(type: .system)
    var logoImage = UIImageView()
    var idTextField = UITextField()
    var pwTextField = UITextField()
    var viewForSignin = UIView()
    
    var slidingUpViewForSignin = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        idTextField.text = ""
        pwTextField.text = ""
        
        setup()
        autoLayout()
        
        self.idTextField.delegate = self
        self.pwTextField.delegate = self
    }
    
    // MARK: - button, textField setting
    func setup() {
        signinButton.setTitle("Sign In", for: .normal)
        signinButton.setTitleColor(#colorLiteral(red: 0.009850479662, green: 0.29078269, blue: 0.5762767196, alpha: 1), for: .normal)
        signinButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        signinButton.layer.cornerRadius = 10
        signinButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        signinButton.addTarget(self, action: #selector(siginin(_:)), for: .touchUpInside)
        view.addSubview(signinButton)
        
        logoImage.image = UIImage(named: "facebookblue")
        view.addSubview(logoImage)
        
//        viewForSignin.backgroundColor = .red
        view.addSubview(viewForSignin)
        
        idTextField.keyboardAppearance = UIKeyboardAppearance.dark
        idTextField.enablesReturnKeyAutomatically = true
        idTextField.clearButtonMode = UITextField.ViewMode.always
        idTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        idTextField.font = UIFont.systemFont(ofSize: 20)
        idTextField.layer.cornerRadius = 10
        idTextField.placeholder = "  id를 입력해주세요"
        idTextField.leftView = UIImageView(image: UIImage(named: "id"))
        idTextField.leftViewMode = .always
        idTextField.leftView?.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
//        idTextField.setLeftPaddingPoints(20)
//        idTextField.setRightPaddingPoints(20)
        viewForSignin.addSubview(idTextField)
        
        pwTextField.keyboardAppearance = UIKeyboardAppearance.dark
        pwTextField.enablesReturnKeyAutomatically = true
        pwTextField.clearButtonMode = UITextField.ViewMode.always
        pwTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        pwTextField.font = UIFont.systemFont(ofSize: 20)
        pwTextField.layer.cornerRadius = 10
        pwTextField.placeholder = "  비밀번호를 입력해주세요"
        pwTextField.isSecureTextEntry = true
        pwTextField.leftView = UIImageView(image: UIImage(named: "pw"))
        pwTextField.leftViewMode = .always
        pwTextField.leftView?.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
//        pwTextField.setLeftPaddingPoints(20)
//        pwTextField.setRightPaddingPoints(20)
        viewForSignin.addSubview(pwTextField)
    }
    
    
    // MARK: - AutoLayout
    var bottomfirstPriority: NSLayoutConstraint?
    var bottomSecondPriority: NSLayoutConstraint?
    
    func autoLayout() {
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        
        signinButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        signinButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70).isActive = true
        signinButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70).isActive = true
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        logoImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 113).isActive = true
        logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        viewForSignin.translatesAutoresizingMaskIntoConstraints = false
        
        viewForSignin.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        viewForSignin.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        viewForSignin.heightAnchor.constraint(equalToConstant: 99).isActive = true
        
        
        bottomfirstPriority = viewForSignin.bottomAnchor.constraint(equalTo: signinButton.topAnchor, constant: -20)
        bottomfirstPriority?.priority = UILayoutPriority(1000)
        bottomfirstPriority?.isActive = true
        
        bottomSecondPriority = viewForSignin.bottomAnchor.constraint(equalTo: signinButton.topAnchor, constant: -250)
        bottomSecondPriority?.priority = UILayoutPriority(750)
        bottomSecondPriority?.isActive = true
        
        
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        
        idTextField.leadingAnchor.constraint(equalTo: viewForSignin.leadingAnchor, constant: 30).isActive = true
        idTextField.trailingAnchor.constraint(equalTo: viewForSignin.trailingAnchor, constant: -30).isActive = true
        idTextField.topAnchor.constraint(equalTo: viewForSignin.topAnchor, constant: 3).isActive = true
        idTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        
        pwTextField.leadingAnchor.constraint(equalTo: viewForSignin.leadingAnchor, constant: 30).isActive = true
        pwTextField.trailingAnchor.constraint(equalTo: viewForSignin.trailingAnchor, constant: -30).isActive = true
        pwTextField.topAnchor.constraint(equalTo: idTextField.topAnchor, constant: 50).isActive = true
        pwTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    // MARK: - Action method
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집 시작")
        
        guard slidingUpViewForSignin == false else { return }
        self.bottomfirstPriority?.isActive = false
        UIView.animate(withDuration: 0.3) {
            
//            self.viewForSignin.frame.origin.y -= 250
            
            self.slidingUpViewForSignin = true
        }
    }
    
    // MARK: - AlertController Action method
    @objc func siginin(_ sender: UIButton) {
        guard let id = idTextField.text, !id.isEmpty else {
            alert(title: "유저정보가 누락되었습니다.", message: "id를 입력해주세요.")
            return
        }
        guard let password = pwTextField.text, !password.isEmpty else {
            alert(title: "비밀번호가 누락되었습니다.", message: "비밀번호를 입력해주세요.")
            return
        }
        
        for user in users {
            if user.name == id && user.password == password {
                print("Signin Success")
                
                let secondViewController = SecondViewController()
//                SecondTableViewController.currentUser = user
                present(secondViewController, animated: true, completion: nil)
            }
        }
        
        alert(title: "Sign in 정보가 일치하지 않습니다.", message: "다시 입력해주세요.")
    }
    
    // MARK: - AlertController setting method
    func alert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 리턴키가 눌러짐")
        
        UIView.animate(withDuration: 0.3) {
//            self.viewForSignin.frame.origin.y += 250
            self.bottomfirstPriority?.isActive = true
        }
        textField.resignFirstResponder()
        slidingUpViewForSignin = false
        return true
    }
    

}

// MARK: - 텍스트필드 여백 적용
//extension UITextField {
//    func setLeftPaddingPoints(_ amount:CGFloat){ //왼쪽에 여백 주기
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
//        self.leftView = paddingView
//        self.leftViewMode = .always
//    }
//
//    func setRightPaddingPoints(_ amount:CGFloat) { //오른쪽에 여백 주기
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
//        self.rightView = paddingView
//        self.rightViewMode = .always
//    }
//}



