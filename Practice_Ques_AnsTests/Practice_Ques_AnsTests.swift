//
//  Practice_Ques_AnsTests.swift
//  Practice_Ques_AnsTests
//
//  Created by Sebastin on 10/15/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import XCTest
@testable import Practice_Ques_Ans

class Practice_Ques_AnsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testResponse(){
        let expec = XCTestExpectation(description: "service need to be complete")
        let service = serviceHandler.init(url: "https://swapi.co/api/planets/1/", method: "GET")
        service.callService { (response) in
            XCTAssertNotNil(response)
            guard let response = response else{
                return
            }
            let aryResidence = response.residents
            XCTAssertTrue(aryResidence.count > 0, "Residence has value")
            expec.fulfill()
        }
       wait(for: [expec], timeout: 10.0)
        
        
    }

    
    
}
