//
//  VolleyPage.swift
//  UI Tests
//
//  Created by Yao Du on 4/04/18.
//  Copyright © 2018 Masilotti.com. All rights reserved.
//

import XCTest

class VolleyPage:XCTestCase {
    
    let manageTeam = XCUIApplication().tables.cells.staticTexts["Manage Team"]
    let manageRoster = XCUIApplication().tables.cells.staticTexts["Manage Roster"]
    let viewSchedule = XCUIApplication().tables.cells.staticTexts["View Schedule"]
    let backButton = XCUIApplication().navigationBars["Manage Roster"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0)
    

    func gotoManage(testcase: XCTestCase) {
        manageTeam.tap()
    }
    
    func gotoManageRoster(testcase:XCTestCase){
        manageRoster.tap()
    }
    
    func gotoViewSchedule(testcase:XCTestCase) {
        viewSchedule.tap()
    }
    func tapBackButton() {
        backButton.tap()
    
    }

        

}
    

