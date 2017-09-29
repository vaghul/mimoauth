//
//  ImageCache.swift
//  MimoAuth
//
//  Created by Vaghula krishnan on 29/09/17.
//  Copyright © 2017 getmimo. All rights reserved.
//

import UIKit

class ImageCache: NSObject {
	
	var cacheobj:NSCache<AnyObject, AnyObject>!
	static let sharedInstance = ImageCache()
	fileprivate override init() {
		cacheobj = NSCache()
		cacheobj.evictsObjectsWithDiscardedContent = true
		cacheobj.countLimit = 50
		cacheobj.totalCostLimit = 45
		super.init()
	}
	
	func hasCacheForKey(_ key:String) -> Bool{
		if cacheobj.object(forKey: key as AnyObject) != nil {
			return true
		}
		return false
	}
	func setCacheForKey(_ key:String,data:Data) {
		cacheobj.setObject(data as AnyObject, forKey: key as AnyObject)
	}
	func getCacheForKey(_ key:String) -> Data{
		return cacheobj.object(forKey: key as AnyObject) as! Data
	}
	
}

