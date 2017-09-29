//
//  LoginScreen+.swift
//  MimoAuth
//
//  Created by Vaghula krishnan on 29/09/17.
//Copyright © 2017 getmimo. All rights reserved.
//


import UIKit

extension LoginScreenViewController: LoginScreenModelDelegate{
	
	func recievedResponce(_ value: [String : AnyObject], method: String) {
		
	}
	func errorResponce(_ value: String, method: String) {
		
	}
}

// MARK: - View extension

extension LoginScreenViewController: LoginScreenViewDelegate{
	
}



// MARK: - Controller extension

