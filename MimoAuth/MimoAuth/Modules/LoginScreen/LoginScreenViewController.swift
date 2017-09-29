//
//  LoginScreenViewController.swift
//  MimoAuth
//
//  Created by Vaghula krishnan on 29/09/17.
//Copyright © 2017 getmimo. All rights reserved.
//


import UIKit

class LoginScreenViewController: BaseViewController {
	
	var model: LoginScreenModel!
	var myView: LoginScreenView! { return self.view as! LoginScreenView }
	
	// MARK: - App LifeCycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view = LoginScreenView(frame:  UIScreen.main.bounds)
		model = LoginScreenModel()
		model?.delegate = self
		myView?.delegate = self
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
	}
	
}





