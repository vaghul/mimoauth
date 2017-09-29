//
//  MimoAuthTests.swift
//  MimoAuthTests
//
//  Created by Vaghula krishnan on 29/09/17.
//  Copyright © 2017 getmimo. All rights reserved.
//

import XCTest
@testable import MimoAuth

class MimoAuthTests: XCTestCase {
	
	var loginVC:LoginScreenViewController!
	var emailTest1:String!
	var emailTest2:String!
	var emailTest3:String!
	var passwordTest1:String!
	var passwordTest2:String!
	
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
		loginVC = LoginScreenViewController()
		emailTest1 = "sampletest"
		emailTest2 = "sampletest@gm"
		emailTest3 = "sampletest@gmail.com"
		passwordTest1 = "test"
		passwordTest2 = "test123"
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
		loginVC = nil
		emailTest1 = nil
		emailTest2 = nil
		emailTest3 = nil
		passwordTest1 = nil
		passwordTest2 = nil

    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
		XCTAssertFalse(loginVC.isValidEmail(email: emailTest1))
		XCTAssertFalse(loginVC.isValidEmail(email: emailTest2))
		XCTAssertTrue(loginVC.isValidEmail(email: emailTest3))
		XCTAssertFalse(loginVC.isValidPassword(password: passwordTest1))
		XCTAssertTrue(loginVC.isValidPassword(password: passwordTest2))
		//XCTAssertFalse(loginVC.isValidPassword(password: passwordTest2)) // To check Test case failure
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
