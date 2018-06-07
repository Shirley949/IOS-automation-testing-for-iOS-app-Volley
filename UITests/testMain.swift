//
//  testMain.swift
//  UI Tests
//
//  Created by Yao Du on 9/04/18.
//  Copyright © 2018 Masilotti.com. All rights reserved.
//

import XCTest

class testMain: XCTestCase {
    let firstpage = VolleyPage()
    let secondpage = MangeTeamPage()
    let thirdpage = ViewSchedulePage()
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        app.launch()
        
    }
    
    
    func testExample() {
        
        firstpage.gotoManage(testcase: XCTestCase())
        firstpage.tapBackButton()
        secondpage.enterText(testcase: XCTestCase(), text: "test")
        secondpage.tapBackButton(testcase: XCTestCase())
        firstpage.gotoViewSchedule(testcase: XCTestCase())
        thirdpage.tapLoadMoreGames(testcase: XCTestCase())
        thirdpage.tapBackButton()
        sleep(5)
        XCTAssert(thirdpage.gametext.exists)
        thirdpage.tapBackButton()
    }
    
}
