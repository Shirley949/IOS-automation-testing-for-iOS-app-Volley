//
//  UITests.swift
//  UITests
//
//  Created by Joe Masilotti on 9/7/15.
//  Copyright © 2015 Masilotti.com. All rights reserved.
//

import XCTest

class UITests:XCTestCase  {
   let app = XCUIApplication()
  
    override func setUp() {
        super.setUp()
        app.launch()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
    }
    
    func test(){
        
//完成课上提到的所有测试
        // click Alert button
        app.tables.cells.staticTexts["View Schedule"].tap()
        app.windows.otherElements.buttons["Finish Game"].tap()
        app.windows.otherElements.alerts["You won!"].buttons["Awesome!"].tap()
        //dump(app)
        //dump(app)
    
    }
    
    func test1(){
        // slider
        app.tables.cells.staticTexts["Manage Team"].tap()
        app.sliders.element.adjust(toNormalizedSliderPosition: 0.9)
        
    }
    
    func test2(){
        //select picker
        app.tables.cells.staticTexts["Manage Team"].tap()
        app.pickers.pickerWheels.matching(identifier: "Attackers Formation").element.adjust(toPickerWheelValue: "6 attackers")
        //app.pickers.pickerWheels.matching(identifier: "Setters Formation").element.adjust(toPickerWheelValue: "1 setters")
         app.pickers.pickerWheels.matching(identifier: "Setters Formation").element.adjust(toPickerWheelValue: "1 setter")
      //  dump(app)
      //  dump(app)
    }
    
    func test3 (){
        // click a link
        app.buttons["More Info"].tap()
        sleep(5)
        app.links["team sport"].tap()
    }
    
    func test4 (){
        // Reordering table cells
        app.staticTexts["Manage Roster"].tap()
        let joebutton = app.buttons["Reorder Joe"]
        app.buttons["Reorder Adrienne"].press(forDuration: 2, thenDragTo: joebutton)
        
        let  firstcell = app.staticTexts["Joe"]
        let start = firstcell.coordinate(withNormalizedOffset: CGVector(dx:0,dy:0))
        let end = firstcell.coordinate(withNormalizedOffset: CGVector(dx:0, dy:10))
        start.press(forDuration: 2, thenDragTo: end)
        //dump(app)
        //dump(app)
    }
    
    func test5 (){
        //Using NSPredicate in matching
        let predicate = NSPredicate(format: "label BEGINSWITH 'Set your team detail'")
        let pre =  app.staticTexts.element(matching: predicate)
        XCTAssert(pre.exists)
        
        app.staticTexts["Manage Team"].tap()
        let selectedFormationLabel = app.staticTexts["6 attackers, 1 setter"]
        XCTAssertFalse(selectedFormationLabel.exists)
        
        let attackersPredicate = NSPredicate(format: "label BEGINSWITH 'Attackers Formation'")
        let attackersPicker = app.pickerWheels.matching(attackersPredicate).element
        attackersPicker.adjust(toPickerWheelValue: "6 attackers")
        
        
        
        let settersPredicate = NSPredicate(format: "label BEGINSWITH 'Setters Formation'")
        let settersPicker = app.pickerWheels.element(matching: settersPredicate)
        settersPicker.adjust(toPickerWheelValue: "1 setter")
        
        XCTAssert(selectedFormationLabel.exists)
        
    }
    
    func test6() {
        // Using Waiting in Test
        app.staticTexts["View Schedule"].tap()
        app.buttons["Load More Games"].tap()
        let nextGame = self.app.staticTexts["Game 4 - Tomorrow"]
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: nextGame, handler: nil);         waitForExpectations(timeout: 5, handler: nil)

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    func testDismissingAnAlert() {
        app.staticTexts["View Schedule"].tap()
        app.buttons["Finish Game"].tap()
        //app.alerts["You won!"].buttons["Awesome!"].tap()
        app.buttons["Awesome!"].tap()
    }
    
    
    func testDismissingASystemAlert() {
        app.staticTexts["View Schedule"].tap()
        
        dump(XCUIApplication())
        
        app.buttons["Find Games Nearby?"].tap()
        app.tap() // need to interact with the app for the handler to fire
        XCTAssert(app.staticTexts["Authorized"].exists)
    }
    
    
    func testAdjustingASlider() {
        app.staticTexts["Manage Team"].tap()
        app.sliders.element.adjust(toNormalizedSliderPosition: 0.9)
        XCTAssert(app.staticTexts["9"].exists)
    }
  
    func testAdjustingAPicker() {
        app.staticTexts["Manage Team"].tap()
        
        let selectedFormationLabel = app.staticTexts["5 attackers, 1 setter"]
        XCTAssertFalse(selectedFormationLabel.exists)
        
        app.pickerWheels.matching(identifier: "Attackers Formation").element.adjust(toPickerWheelValue: "5 attackers")
        app.pickerWheels.matching(identifier: "Attackers Formation").element.adjust(toPickerWheelValue: "6 attackers")
        app.pickerWheels.matching(identifier: "Attackers Formation").element.adjust(toPickerWheelValue: "4 attackers")
        app.pickerWheels.matching(identifier: "Attackers Formation").element.adjust(toPickerWheelValue: "5 attackers")
      
        app.pickerWheels.matching(identifier: "Setters Formation").element.adjust(toPickerWheelValue: "1 setter")
        app.pickerWheels.matching(identifier: "Setters Formation").element.adjust(toPickerWheelValue: "2 setters")
        app.pickerWheels.matching(identifier: "Setters Formation").element.adjust(toPickerWheelValue: "1 setter")
        app.pickerWheels.matching(identifier: "Setters Formation").element.adjust(toPickerWheelValue: "2 setters")
        app.pickerWheels.matching(identifier: "Setters Formation").element.adjust(toPickerWheelValue: "1 setter")
        
        XCTAssert(selectedFormationLabel.exists)
    }
    
    func testTappingALinkInAWebView() {
        app.buttons["More Info"].tap()
        
        app.links["Volleyball (disambiguation)"].tap()
       
        app.links["Volleyball (ball)"].tap()
    
    }
    
    
    func testCellReordering() {
        app.staticTexts["Manage Roster"].tap()
        
        print(app.buttons["Reorder Joe"].frame.maxY)
        print(app.buttons["Reorder Brian"].frame.minY)
        
        app.buttons["Reorder Joe"].press(forDuration: 0.5, thenDragTo: app.buttons["Reorder Brian"])

        print(app.buttons["Reorder Joe"].frame.maxY)
        print(app.buttons["Reorder Brian"].frame.minY)
        
        XCTAssertLessThanOrEqual(app.buttons["Reorder Joe"].frame.maxY, app.buttons["Reorder Brian"].frame.minY)
    }
    
    
    func testWaitingForAnElementToAppear() {
        app.staticTexts["Manage Roster"].tap()
        
        let firstcell = app.staticTexts["Evan"]
        
        let start = firstcell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let finish = firstcell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 15))
        start.press(forDuration: 0, thenDragTo: finish)
    }

    
    
    func test2ElementExistsWithPredicate() {
        
//        let predicate = NSPredicate(format: "label BEGINSWITH 'Set your team details'")
//        let label = app.staticTexts.element(matching: predicate)
//        XCTAssert(label.exists)
        
//        let predicate2 = NSPredicate(format: "label ENDSWITH 'upcoming games.'")
//        let label2 = app.staticTexts.element(matching: predicate2)
//        XCTAssert(label2.exists)
//
//        
//        let predicate3 = NSPredicate(format: "label BEGINSWITH[cd] 'set your team details'")
//        let label3 = app.staticTexts.element(matching: predicate3)
//        XCTAssert(label3.exists)
//        
        let predicate4 = NSPredicate(format: "label CONTAINS 'your roster'")
        let label4 = app.staticTexts.element(matching: predicate4)
        XCTAssert(label4.exists)
        
        //        BEGINSWITH
        //        Left hand expression begins with the right hand expression
        //
        //        [c] case insensitive: lowercase & uppercase values are treated the same
        //
        //        [d] diacritic insensitive: special characters treated as the base character
        //
        //        https://realm.io/news/nspredicate-cheatsheet/?gclid=COfMkbPVn9ICFccGKgod3UQGuA
 
    }
    
    
    func testAdjustingAPicker2() {
        app.staticTexts["Manage Team"].tap()
        
        let selectedFormationLabel = app.staticTexts["5 attackers, 1 setter"]
        XCTAssertFalse(selectedFormationLabel.exists)
        
        
        let attackersPredicate = NSPredicate(format: "label BEGINSWITH 'Attackers Formation'")
        
        let attackersPicker = app.pickerWheels.matching(attackersPredicate).element
        
        attackersPicker.adjust(toPickerWheelValue: "5 attackers")
        
        
        
        let settersPredicate = NSPredicate(format: "label BEGINSWITH 'Setters Formation'")
        let settersPicker = app.pickerWheels.element(matching: settersPredicate)
        settersPicker.adjust(toPickerWheelValue: "1 setter")
        
        XCTAssert(selectedFormationLabel.exists)
    }
    
    func testwaitfail() {
        app.staticTexts["View Schedule"].tap()
        
        app.buttons["Load More Games"].tap()
        
        let nextGame = self.app.staticTexts["Game 4 - Tomorrow"]
        
        XCTAssert(nextGame.exists)
        
        
    }
    
    func testwaitWithoutHandler() {
    
        app.staticTexts["View Schedule"].tap()
        
        app.buttons["Load More Games"].tap()
        
        let nextGame = self.app.staticTexts["Game 4 - Tomorrow"]
        
        let existsPredicate = NSPredicate(format: "exists == true")
        
        expectation(for: existsPredicate, evaluatedWith: nextGame, handler: nil)
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssert(nextGame.exists)
        
    }
    
    
    func testwaitWithHandler() {
    
        app.staticTexts["View Schedule"].tap()
        
        app.buttons["Load More Games"].tap()
        
        let nextGame = self.app.staticTexts["Game 4 - Tomorrow"]
        
        let existsPredicate = NSPredicate(format: "exists == true")
        
        expectation(for: existsPredicate, evaluatedWith: nextGame, handler: nil)
        
        waitForExpectations(timeout: 1) { (error) -> Void in
            if (error != nil){
                let message = "Failed to find after 1 seconds."
                self.recordFailure(withDescription: message, inFile: #file, atLine: #line, expected: true)
            }
        }
        
        XCTAssert(nextGame.exists)
    }
    
    func testwait() {
        
        app.staticTexts["View Schedule"].tap()
        
        app.buttons["Load More Games"].tap()
        
        let nextGame = self.app.staticTexts["Game 4 - Tomorrow"]
        
        let existsPredicate = NSPredicate(format: "exists == true")
        
        
        expectation(for: existsPredicate, evaluatedWith: nextGame, handler: nil)
        
        //without handler
        waitForExpectations(timeout: 5, handler: nil)
        
        //              with handler
        //            waitForExpectations(timeout: 5) { (error) -> Void in
        //                if (error != nil){
        //                    let message = "Failed to find after 5 seconds."
        //                    self.recordFailure(withDescription: message, inFile: #file, atLine: #line, expected: true)
        //                }
        //
        //            }
        
        //            https://developer.apple.com/reference/xctest/xctestcase/1500569-expectation
        //            https://developer.apple.com/reference/xctest/xctestcase/1500748-waitforexpectations
        //            https://developer.apple.com/reference/xctest/xctestcase/1500748-waitforexpectations
        
        
        
        //            waitForExpectations(timeout: 5) { (Error) in
        //                self.recordFailure(withDescription: "Failed to find element after 5 seconds", inFile: file, atLine: line, expected: true)
        
        //waitForExpectations(timeout: 5, handler: nil)
        
        //waitForElementToAppear(nextGame)
        
        XCTAssert(nextGame.exists)
        
    }
    

    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func testRefreshControl() {
        app.staticTexts["Manage Roster"].tap()

        let firstCell = app.staticTexts["Adrienne"]
        let coordinate = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let bottom = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 15))
        coordinate.press(forDuration: 0, thenDragTo: bottom)

        app.buttons["Dismiss"].tap()
    }
    
    
    func testElementExists2() {
         XCTAssert(app.staticTexts["Manage Team"].exists)
        
        let st = app.staticTexts["Manafdsge Team"]
        XCTAssertFalse(st.exists)
        

    }
    
    

    func testElementExists() {
        print(app.debugDescription)
        XCTAssert(app.staticTexts["Volley"].exists)
        
    }

    func testElementExistsWithPredicate2() {
        let predicate = NSPredicate(format: "label BEGINSWITH[cd] 'set your team details'")
        let label = app.staticTexts.element(matching: predicate)
        XCTAssert(label.exists)
        
        
        
    }

    func testElementWithEllipseExists() {
        app.staticTexts["Manage Roster"].tap()

        let longNameCell = app.staticTexts["Adolph Blaine Charles David Earl Frederick Gerald Hubert Irvin John Kenneth Lloyd Martin Nero Oliver Paul Quincy Randolph Sherman Thomas Uncas Victor William Xerxes Yancy Wolfeschlegelsteinhausenbergerdorff, Senior"]
        XCTAssert(longNameCell.exists)
        
    }

    func testTappingAButton() {
        app.buttons["More Info"].tap()
        XCTAssert(app.navigationBars["Volleyball?"].exists)
    }

    func testTypingText() {
        app.staticTexts["Manage Team"].tap()

        let textField = app.textFields["Team Name"]
        textField.tap()
        textField.typeText("Dig Newtons")
    }
    
    












    func testTextExistsInAWebView() {
        app.buttons["More Info"].tap()
        let volleyballLabel = app.staticTexts["Volleyball"]
         //waitForElementToAppear(volleyballLabel)
        XCTAssert(volleyballLabel.exists)
    }



    func testPushingAController() {
        app.buttons["More Info"].tap()
        XCTAssert(app.navigationBars["Volleyball?"].exists)
    }

    func testPoppingAViewController() {
        app.buttons["More Info"].tap()
        XCTAssert(app.navigationBars["Volleyball?"].exists)
        app.navigationBars.buttons.element(boundBy: 0).tap()
        XCTAssert(app.navigationBars["Volley"].exists)
    }
}
