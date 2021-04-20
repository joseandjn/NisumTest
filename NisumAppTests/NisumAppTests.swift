//
//  NisumAppTests.swift
//  NisumAppTests
//
//  Created by Josean Donato Jaulis Nina on 4/19/21.
//  Copyright © 2021 Josean Donato Jaulis Nina. All rights reserved.
//

import XCTest
@testable import NisumApp

class NisumAppTests: XCTestCase {

    var presenter : SearchDefinitionPresenter!
    var repository : AcromineRepository!
    var interactor : AcromineInteractor!
    var apiRest : ApiRest!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.presenter = SearchDefinitionPresenter()
        self.apiRest = ApiRestImpl.instance
        self.repository = AcronymoRepositoryImpl(apiRest: self.apiRest)
        self.interactor = AcromineInteractorImpl(repository: self.repository)
    }

    override func tearDownWithError() throws {
        self.presenter = nil
        self.interactor = nil
        self.repository = nil
    }

    func testSearchDefinitionPresenter() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let text = "OSM"
        self.interactor
            .searchAllDefinitions(abbreviation: text) {
                
                response in
                
                if response.isSuccess {
                    guard let lstResults = response.data, !lstResults.isEmpty, !lstResults[0].lfs.isEmpty else {
                        XCTAssertFalse(false, "Not Results")
                        return
                    }
                    //self.lstDefinitions = lstResults[0].lfs
                    XCTAssert(true, "Results is successful")
                } else {
                    XCTAssertFalse(false, "Not Results")
                }
                
        }
        
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
