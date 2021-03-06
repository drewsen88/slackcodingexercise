//
//  CodingExerciseTests.swift
//  CodingExerciseTests
//
//  Created by Drew Sen on 1/15/20.
//  Copyright © 2018 slack. All rights reserved.
//

import XCTest
@testable import CodingExercise


class CodingExerciseTests: XCTestCase {
    
    var systemUnderTest: AutocompleteViewController!
    var dataProvider: UserSearchResultDataProvider!
    var autoCompleteViewModel: AutocompleteViewModel!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataProvider = UserSearchResultDataProvider(slackAPI: SlackApi.shared)
        autoCompleteViewModel = AutocompleteViewModel(dataProvider: dataProvider)
        
         systemUnderTest = AutocompleteViewController(viewModel: autoCompleteViewModel)
        

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        systemUnderTest = nil
        super.tearDown()
    }
    
    
    //Unit test that passes
    func testSearchBar(){
        
        XCTAssert(systemUnderTest.conforms(to: UITextFieldDelegate.self))
        XCTAssertTrue(self.systemUnderTest.responds(to: (#selector(systemUnderTest.textFieldDidChange(textField:)))))
        
    }
    
    
    //Unit test that fails
    func testSearchTextField(){
        XCTAssert(systemUnderTest.conforms(to: UITextFieldDelegate.self))
        XCTAssertFalse(self.systemUnderTest.responds(to: (#selector(systemUnderTest.textFieldDidChange(textField:)))))

    }
    
    //Test case that exercises the UI elements of the view
    func testTableView(){
        
        XCTAssert(systemUnderTest.conforms(to: UITableViewDelegate.self))
        XCTAssert(systemUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(self.systemUnderTest.responds(to: (#selector(systemUnderTest.tableView(_:numberOfRowsInSection:)))))
        XCTAssertTrue(self.systemUnderTest.responds(to: (#selector(systemUnderTest.tableView(_:cellForRowAt:)))))
        
    }
    
    //end to end testing of json download and mapping
    func testJSONMapping() {
        
        //fetch usernames beginning with t - should be non-empty
        self.autoCompleteViewModel.fetchUserNames("t") { usernames in
            DispatchQueue.main.async {
                         XCTAssertNotNil(usernames, "should not be nil")
          }
            
        }


    }


    

}
