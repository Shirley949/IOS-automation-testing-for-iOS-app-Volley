//
//  ViewSchedulePage.swift
//  UI Tests
//
//  Created by Yao Du on 4/04/18.
//  Copyright © 2018 Masilotti.com. All rights reserved.
//

import XCTest

class ViewSchedulePage: XCTestCase {
        
    let loadMoreGames = XCUIApplication().buttons["Load More Games"]
    let backButton = XCUIApplication().navigationBars["Manage Team"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0)
    let gametext = XCUIApplication().staticTexts["Game 4 - Tomorrow"]
    
    
    func tapBackButton()    {
    
        backButton.tap()
    }
    
    func tapLoadMoreGames(testcase: XCTestCase)    {
        loadMoreGames.tap()
    }
    

}
