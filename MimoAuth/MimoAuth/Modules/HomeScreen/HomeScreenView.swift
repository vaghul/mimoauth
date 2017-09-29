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
	func onClickLogout()
}
class HomeScreenView: BaseView {
	
	weak var delegate: HomeScreenViewDelegate?
	private var labelTitle: UILabel!
	private var imageView: UIImageView!
	private var labelname: UILabel!
	private var labelemail:UILabel!
	private var buttonlogout:UIButton!
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
		labelTitle.setTextWithSpacing("Welcome", space: 0.2)

		imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.clipsToBounds = true
		

		labelname = UILabel()
		labelname.setAttributes("Aerial", fontSize: 18, textColor: .black, textAlignment: .center)

		labelemail = UILabel()
		labelemail.setAttributes("Aerial", fontSize: 18, textColor: .black, textAlignment: .center)
		
		buttonlogout = UIButton()
		buttonlogout.setTitle("Logout", for: .normal)
		buttonlogout.backgroundColor = .lightGray
		buttonlogout.setTitleColor(.white, for: .normal)
		buttonlogout.setTitleColor(.lightGray, for: .highlighted)
		buttonlogout.layer.cornerRadius = 5
		buttonlogout.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)


		addSubview(labelTitle)
		addSubview(imageView)
		addSubview(labelname)
		addSubview(labelemail)
		addSubview(buttonlogout)
	}
	func setValues(name:String,email:String){
		labelname.setTextWithSpacing("They call me \(name)", space: 0.2)
		labelemail.setTextWithSpacing("Contact me at \(email)", space: 0.2)
	}
	func setUserimage(image:UIImage){
		imageView.image = image
	}
	@objc func onButtonClick(){
		delegate?.onClickLogout()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
	
		labelTitle.frame = CGRect(x: calculatePercentWidth(16), y: calculatePercentHeight(30), width: self.getWidth() - calculatePercentWidth(16 + 16), height: 30)
		
		imageView.frame = CGRect(x: (self.getWidth() - calculatePercentWidth(58)) / 2 , y: labelTitle.calculateOffSetY() + calculatePercentHeight(30), width: calculatePercentWidth(58), height: calculatePercentHeight(58))
		imageView.MakeViewCircle()
		
		labelname.frame = CGRect(x: calculatePercentWidth(16), y: imageView.calculateOffSetY() + calculatePercentHeight(15), width: self.getWidth() - calculatePercentWidth(16 + 16), height: 25)
		
		labelemail.frame = CGRect(x: calculatePercentWidth(16), y: labelname.calculateOffSetY() + calculatePercentHeight(15), width: self.getWidth() - calculatePercentWidth(16 + 16), height: 25)

		buttonlogout.frame = CGRect(x: calculatePercentWidth(16), y: labelemail.calculateOffSetY() + calculatePercentHeight(15), width: self.getWidth() - calculatePercentWidth(16 + 16), height: 25)
		
	}
	
}






