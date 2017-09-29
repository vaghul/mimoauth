//
//  BaseViewController.swift
//  MimoAuth
//
//  Created by Vaghula krishnan on 29/09/17.
//Copyright © 2017 getmimo. All rights reserved.
//


import UIKit

class BaseViewController: UIViewController {
	
	let constants = Macros()
	
	func showAlert(_ title: String, message: String) {
		let alert = UIAlertController(title: title,
		                              message: message,
		                              preferredStyle: UIAlertControllerStyle.alert)
		
		let cancelAction = UIAlertAction(title: "Okay", style: .cancel) { (action) in
			alert.dismiss(animated: true, completion: nil)
		}
		
		alert.addAction(cancelAction)
		self.present(alert, animated: true, completion: nil)
	}
}
