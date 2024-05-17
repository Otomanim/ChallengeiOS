//
//  DetailsViewModel.swift
//  ChallengeiOSTests
//
//  Created by Evandro Rodrigo Minamoto on 16/05/24.
//

import XCTest
@testable import ChallengeiOS 

class DetailsViewModelTests: XCTestCase {
    
    var networkService = NetworkServiceSpy()
    
    lazy var sut: DetailsViewModel = {
        let viewModel = DetailsViewModel(article: nil, networkService: networkService)
        return viewModel
    }()
    
    
    func testUpdateLoadImage_shouldDetailsViewModel_andCallDetailsViewModel() {
        //given
        let viewModel = sut
        let expectation = self.expectation(description: "Carregamento de imagem")
        
        //when
        sut.loadImage { image in
            XCTAssertNil(image, "A imagem não deve ser nula")
            expectation.fulfill()
        }
        
        //then
        waitForExpectations(timeout: 1, handler: nil)
    }
    
}

