//
//  HomeViewModelTests.swift
//  ChallengeiOSTests
//
//  Created by Evandro Rodrigo Minamoto on 11/05/24.
//

import XCTest
@testable import ChallengeiOS

final class HomeViewModelTests: XCTestCase {
    
    let networkService = NetworkServiceSpy()
    
    lazy var sut: HomeViewModel = {
        let viewModel = HomeViewModel(networkService: networkService)
        return viewModel
    }()
    
    func testFetchData_shouldNetworkServiceGetData() {
        //given
        let brasil = "Brasil"
        
        //when
        sut.fetchData(for: brasil)
        
        //then
        XCTAssertTrue(networkService.didCallGetData)
    }
}

