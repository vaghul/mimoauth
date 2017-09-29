//
//  LoginScreenModel.swift
//  MimoAuth
//
//  Created by Vaghula krishnan on 29/09/17.
//Copyright © 2017 getmimo. All rights reserved.
//



import UIKit


// MARK: -  Delegate Protocol

protocol LoginScreenModelDelegate: class {
	
	func recievedResponce(_ value: [String:AnyObject], method: String)
	func errorResponce(_ value: String, method: String)
	
}

class LoginScreenModel: BaseModel {
	
	
	weak var delegate: LoginScreenModelDelegate?
	
	// MARK: -  SuperClass Overrides
	
	override func responceRecieved(_ responce: [String:AnyObject], method: String)
	{
		
		delegate?.recievedResponce(responce, method: method)
		
	}
	
	override func errorRecieved(_ response: String, method: String)
	{
		delegate?.errorResponce(response, method: method)
		
	}
	
	// MARK: -  Custom Method
	
	func createNewUser(_ email:String,password:String){
		let param = ["email":email,"password":password]
		sendPostRequest(constants.SignUpURL, body: param as [String:AnyObject], method: "SignUp")
	}
	
	func LoginUser(_ email:String, password:String) {
		let param = ["username":email,"password":password,"scope":constants.SCOPE,"grant_type":constants.PASSWORDGRANT]
		sendPostRequest(constants.LoginURL, body: param as [String:AnyObject], method: "Login")

	}
	
}






