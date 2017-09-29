//
//  HomeScreenView.swift
//  MimoAuth
//
//  Created by Vaghula krishnan on 29/09/17.
//Copyright © 2017 getmimo. All rights reserved.
//


import UIKit


// MARK: -  Delegate Protocol

protocol HomeScreenViewDelegate: class {
	
}
class HomeScreenView: BaseView {
	
	weak var delegate: HomeScreenViewDelegate?
	var labelTitle: UILabel!
	var imageView: UIImageView!
	var labe 
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
		
		backgroundColor = .red
		
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
	}
	
}






