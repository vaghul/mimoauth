//
//  LoginScreenView.swift
//  MimoAuth
//
//  Created by Vaghula krishnan on 29/09/17.
//Copyright © 2017 getmimo. All rights reserved.
//


import UIKit


// MARK: -  Delegate Protocol

protocol LoginScreenViewDelegate: class {
	func onClickButton(tag:Int)
}
class LoginScreenView: BaseView {
	
	weak var delegate: LoginScreenViewDelegate?
	var labelTitle: UILabel!
	var inputemail:UITextField!
	var inputpassword:UITextField!
	var buttonLogin:UIButton!
	var buttonSignUp:UIButton!
	
	// MARK: -  SuperClass Overrides
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.onCreate()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func onCreate() {
		super.onCreate()
		
		backgroundColor = .white
		
		labelTitle = UILabel()
		labelTitle.setAttributes("Copperplate-Bold", fontSize: 25, textColor: .black, textAlignment: .center)
		labelTitle.setTextWithSpacing("Login", space: 0.2)
		
		inputemail = UITextField()
		inputemail.placeholder = "Enter your Email-id"
		inputemail.text = "test123@gmail.com"
		inputemail.keyboardType = .emailAddress
		inputemail.layer.cornerRadius = 5
		//inputemail.layer.borderColor = .lightGray.CGcolor
		inputemail.layer.borderWidth = 1
		
		inputpassword = UITextField()
		inputpassword.placeholder = "Enter your Password"
		inputpassword.keyboardType = .default
		inputpassword.isSecureTextEntry = true
		inputpassword.text = "test@gmail.com"
		inputpassword.layer.cornerRadius = 5
		//inputemail.layer.borderColor = .lightGray.CGcolor
		inputpassword.layer.borderWidth = 1
		
		buttonLogin = UIButton()
		buttonLogin.setTitle("Login", for: .normal)
		buttonLogin.backgroundColor = .lightGray
		buttonLogin.setTitleColor(.white, for: .normal)
		buttonLogin.setTitleColor(.lightGray, for: .highlighted)
		buttonLogin.layer.cornerRadius = 5
		buttonLogin.tag = 0
		buttonLogin.addTarget(self, action: #selector(onButtonClick(sender:)), for: .touchUpInside)
		
		buttonSignUp = UIButton()
		buttonSignUp.setTitle("Sign Up", for: .normal)
		buttonSignUp.backgroundColor = .lightGray
		buttonSignUp.setTitleColor(.white, for: .normal)
		buttonSignUp.setTitleColor(.lightGray, for: .highlighted)
		buttonSignUp.layer.cornerRadius = 5
		buttonSignUp.tag = 1
		buttonSignUp.addTarget(self, action: #selector(onButtonClick(sender:)), for: .touchUpInside)

		addSubview(labelTitle)
		addSubview(inputemail)
		addSubview(inputpassword)
		addSubview(buttonLogin)
		addSubview(buttonSignUp)
		
	}
	@objc func onButtonClick(sender:UIButton){
		delegate?.onClickButton(tag: sender.tag)
	}
	func getEmailValue() -> String {
		 guard let email = inputemail.text else {
			return ""
		}
		return email
	}
	func getPasswordValue() -> String {
		guard let password = inputpassword.text else {
			return ""
		}
		return password
	}
	override func layoutSubviews() {
		super.layoutSubviews()
		
		labelTitle.frame = CGRect(x: calculatePercentWidth(16), y: calculatePercentHeight(30), width: self.getWidth() - calculatePercentWidth(16 + 16), height: 30)
		
		inputemail.frame = CGRect(x: calculatePercentWidth(16), y: labelTitle.calculateOffSetY() + calculatePercentHeight(20), width: self.getWidth() - calculatePercentWidth(16 + 16), height: 30)
		
		inputpassword.frame = CGRect(x: calculatePercentWidth(16), y: inputemail.calculateOffSetY() + calculatePercentHeight(20), width: self.getWidth() - calculatePercentWidth(16 + 16), height: 30)
		
		buttonLogin.frame = CGRect(x: calculatePercentWidth(16), y: inputpassword.calculateOffSetY() + calculatePercentHeight(15), width: self.getWidth()/2 - calculatePercentWidth(16 + 16), height: 30)
		
		buttonSignUp.frame = CGRect(x: buttonLogin.calculateOffSetX() + calculatePercentWidth(16), y: inputpassword.calculateOffSetY() + calculatePercentHeight(15), width: self.getWidth()/2 - calculatePercentWidth(16 + 16), height: 30)
	}
	
}
