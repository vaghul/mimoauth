//
//  Storage.swift
//  MimoAuth
//
//  Created by Vaghula krishnan on 29/09/17.
//  Copyright © 2017 getmimo. All rights reserved.
//

import UIKit

class Storage: NSObject {

	static let sharedInstance = Storage()
	
	func storeValue(_ value:String,key:String){
		UserDefaults.standard.set(value, forKey: key)
		UserDefaults.standard.synchronize()
	}
	func retriveValue(key:String) -> String{
		return UserDefaults.standard.value(forKey: key) as! String
	}
	func isValueStored(key:String) -> Bool{
		return (UserDefaults.standard.value(forKey: key) != nil)
	}
	func purgeValues(){
		let domain = Bundle.main.bundleIdentifier
		UserDefaults.standard.removePersistentDomain(forName: domain!)
	}
}
