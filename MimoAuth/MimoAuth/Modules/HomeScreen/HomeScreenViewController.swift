//
//  HomeScreenViewController.swift
//  MimoAuth
//
//  Created by Vaghula krishnan on 29/09/17.
//Copyright © 2017 getmimo. All rights reserved.
//


import UIKit

class HomeScreenViewController: BaseViewController {
	
	var model: HomeScreenModel!
	var myView: HomeScreenView! { return self.view as! HomeScreenView }
	
	// MARK: - App LifeCycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view = HomeScreenView(frame:  UIScreen.main.bounds)
		model = HomeScreenModel()
		model?.delegate = self
		myView?.delegate = self
		
		myView.showLoader()
		model.getUserDetails()
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




