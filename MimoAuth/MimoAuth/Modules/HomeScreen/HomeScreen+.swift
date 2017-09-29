//
//  HomeScreen+.swift
//  MimoAuth
//
//  Created by Vaghula krishnan on 29/09/17.
//Copyright © 2017 getmimo. All rights reserved.
//


import UIKit

// MARK: - Model extension

extension HomeScreenViewController: HomeScreenModelDelegate{
	
	func recievedResponce(_ value: [String : AnyObject], method: String) {
		if method == "userdetails" {
			myView.removeLoader()
			myView.setValues(name: value["nickname"] as! String, email: value["name"] as! String)
			let url = value["picture"] as! String
			model.getImageDataFromUrl(url, completion: { (data, response, error) in
				DispatchQueue.main.async {
					if error == nil {
						self.myView.setUserimage(image: UIImage(data:data!)!)
					}
				}
			})
		}
		
	}
	func errorResponce(_ value: String, method: String) {
		if method == "userdetails" {
			showAlert("Error Occured", message: "You are logged out! Try Again later")
			onClickLogout()
		}
	}
}

// MARK: - View extension

extension HomeScreenViewController: HomeScreenViewDelegate{
	
	func onClickLogout() {
		Storage.sharedInstance.purgeValues()
		self.navigationController?.popViewController(animated: true)
	}
	
}


// MARK: - Controller extension

