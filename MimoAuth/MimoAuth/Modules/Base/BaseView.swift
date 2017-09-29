//
//  BaseView.swift
//  MimoAuth
//
//  Created by Vaghula krishnan on 29/09/17.
//Copyright © 2017 getmimo. All rights reserved.
//


import UIKit


class BaseView: UIView {
	
	private var overlayView:UIView!
	private var myActivityIndicator:UIActivityIndicatorView!
	let constants = Macros()
	func onCreate(){
		
		
		overlayView = UIView()
		overlayView.clipsToBounds = true
		overlayView.backgroundColor = UIColor.lightGray
		overlayView.alpha = 0.80
		myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
		myActivityIndicator.activityIndicatorViewStyle = .whiteLarge
		
		overlayView.addSubview(myActivityIndicator)
		
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		overlayView.frame = CGRect(x: 0, y: 0, width: self.getWidth(), height: self.getHeight())
		myActivityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
		
	}
	
	func showLoader(){
		overlayView.layer.zPosition = 10
		getAppDelegate().window?.addSubview(overlayView)
		myActivityIndicator.startAnimating()
	}
	func removeLoader(){
		myActivityIndicator.stopAnimating()
		overlayView.removeFromSuperview()
	}
	
	func calculatePercentWidth(_ val:CGFloat) -> CGFloat {
		let width = UIScreen.main.bounds.width
		return ((width * ((val * 100) / 375))/100)
	}
	
	func calculatePercentHeight(_ val:CGFloat) -> CGFloat {
		let height = UIScreen.main.bounds.height
		return ((height * ((val * 100) / 667))/100)
	}
}
