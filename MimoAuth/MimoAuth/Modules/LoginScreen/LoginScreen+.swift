//
//  LoginScreen+.swift
//  MimoAuth
//
//  Created by Vaghula krishnan on 29/09/17.
//Copyright © 2017 getmimo. All rights reserved.
//


import UIKit

extension LoginScreenView : UITextFieldDelegate{
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if textField.tag == 0{
			showPassword()
		}
		if textField.tag == 1{
			resignPassword()
		}
		return true
	}
}
extension LoginScreenViewController: LoginScreenModelDelegate{
	
	func recievedResponce(_ value: [String : AnyObject], method: String) {
		if method == "SignUp" {
			model.LoginUser(myView.getEmailValue(), password: myView.getPasswordValue())
		}else if method == "Login"{
			Storage.sharedInstance.storeValue(value["id_token"] as! String, key: "id_token")
			Storage.sharedInstance.storeValue(value["access_token"] as! String, key: "access_token")
			myView.removeLoader()
			myView.endEditing(true)
			myView.clearTextFeilds()
			self.navigationController?.pushViewController(HomeScreenViewController(), animated: true)
		}
	}
	func errorResponce(_ value: String, method: String) {
		myView.removeLoader()
		if method == "SignUp"{
			if value.contains("user_exists") {
				showAlert("SignUp Error", message: "User already Exists! Please Login")
			}
		}else if method == "Login"{
			if value.contains("invalid_user_password"){
				showAlert("Login Error", message: "Invalid username or password")
			}
		}
	}
}

// MARK: - View extension

extension LoginScreenViewController: LoginScreenViewDelegate{
	func onClickButton(tag: Int) {
		if !isValidEmail(email: myView.getEmailValue()) {
			showAlert("Invalid Details", message: "Enter valid Email-id")
		}else if !isValidPassword(password: myView.getPasswordValue()) {
			showAlert("Invalid Details", message: "Enter password with more than 6 characters")
		}else{
			myView.showLoader()
			if tag == 0 {
				model.LoginUser(myView.getEmailValue(), password: myView.getPasswordValue())
			}else if tag == 1{
				model.createNewUser(myView.getEmailValue(), password: myView.getPasswordValue())
			}
		}
	}
}



// MARK: - Controller extension

