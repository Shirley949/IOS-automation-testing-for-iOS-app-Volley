//
//  MangeTeamPage.swift
//  UI Tests
//
//  Created by Yao Du on 9/04/18.
//  Copyright © 2018 Masilotti.com. All rights reserved.
//

import XCTest

class MangeTeamPage{
    let teamName = XCUIApplication().textFields["Team Name"]
    let backButton = XCUIApplication().navigationBars["Manage Team"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0)
    
    func enterText(testcase: XCTestCase, text:String){
        teamName.tap()
        teamName.typeText(text)
    }

    func tapBackButton(testcase: XCTestCase) {
        backButton.tap()
    }
    
}
