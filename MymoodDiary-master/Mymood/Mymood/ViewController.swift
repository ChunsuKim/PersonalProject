//
//  ViewController.swift
//  Mymood
//
//  Created by LEE HAEUN on 2019. 4. 30..
//  Copyright © 2019년 LEE HAEUN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initView()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func initView(){
        dateLabel.text = getTodayDate()
        labelStack.addArrangedSubview(dateLabel)
        labelStack.addArrangedSubview(mainLabel)
        view.addSubview(labelStack)
        view.addSubview(writeBtn)
        view.addSubview(textfield)
        
        print(view.frame)
        NSLayoutConstraint.activate([
            labelStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            writeBtn.topAnchor.constraint(equalTo: labelStack.bottomAnchor,constant: 10),
            writeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            writeBtn.widthAnchor.constraint(equalToConstant: view.frame.width/2),
            writeBtn.heightAnchor.constraint(equalToConstant: 50),
            textfield.topAnchor.constraint(equalTo: writeBtn.bottomAnchor, constant: 10),
            textfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textfield.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            ])
//        bottomConstraint?.isActive = true
        writeBtn.addTarget(nil, action: #selector(writeBtnEvent), for: .touchDown)
        
    }
    @objc func writeBtnEvent(){
        print("event")
        if textfield.isHidden {
            textfield.isHidden = false
            UIView.setAnimationsEnabled(false)
            writeBtn.setTitle("기록하기", for: .normal)
            view.layoutIfNeeded()
            UIView.setAnimationsEnabled(true)

            UIView.animate(withDuration: 0.7, animations: {
                self.labelStack.frame = CGRect(x: self.view.layoutMarginsGuide.layoutFrame.minX, y: self.view.layoutMarginsGuide.layoutFrame.minY + 10, width: self.labelStack.frame.width, height: self.labelStack.frame.height)
                self.writeBtn.frame = CGRect(x: self.view.layoutMarginsGuide.layoutFrame.minX, y: self.labelStack.frame.maxY + 10, width: self.writeBtn.frame.width, height: self.writeBtn.frame.height)
                self.textfield.frame = CGRect(x: self.textfield.frame.minX, y: self.writeBtn.frame.maxY + 10, width: self.textfield.frame.width, height: self.view.frame.maxY - self.writeBtn.frame.maxY - 15)
                self.writeBtn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                self.mainLabel.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                self.dateLabel.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            }, completion: {finished in

            })
        }else{
            textfield.isHidden = true
            UIView.animate(withDuration: 1, animations: {
                self.writeBtn.setTitle("입력하기", for: .normal)
                self.writeBtn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                self.mainLabel.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
                self.dateLabel.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)

                self.view.layoutIfNeeded()
            }, completion: nil)

        }
    }
    func getTodayDate()-> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월 d일"
        let now = Date()
        let dateString = formatter.string(from:now)
        return dateString
    }
    lazy var topView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var labelStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
//        stack.distribution = .
        return stack
    }()
    lazy var dateLabel : UILabel = {
        let label = UILabel()
        label.text = "2019년 4월 30일"
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var mainLabel : UILabel = {
        let label = UILabel()
        label.text = "안녕하세요. \n오늘은 어떤 일이 있으셨나요 ? "
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let btnView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    let btnStack : UIStackView = {
//        let stack = UIStackView()
//        stack.backgroundColor = .red
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .vertical
//        stack.alignment = .center
//        //        stack.distribution = .
//        return stack
//    }()
    let writeBtn : UIButton = {
        let button = UIButton()
        button.setTitle("입력하기", for: .normal)
//        button.setTitle("기록하기", for: .selected)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
//        button.titleLabel?.textColor = .white
        return button
    }()
    lazy var textfield : UITextView = {
        let text = UITextView()
        text.isHidden = true
//        text.backgroundColor = .red
        text.translatesAutoresizingMaskIntoConstraints  = false
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 2
        text.tintColor = .black
        text.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        text.clipsToBounds = true
        text.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return  text
    }()
}

