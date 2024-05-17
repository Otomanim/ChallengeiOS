//
//  NetworkServiceSpy.swift
//  ChallengeiOSTests
//
//  Created by Evandro Rodrigo Minamoto on 17/05/24.
//

import XCTest
@testable import ChallengeiOS

class NetworkServiceSpy: NetworkServiceProtocol {
    
    private(set) var didCallGetData = false
    
    func getData(keyword: String, completion: @escaping (Result<[ChallengeiOS.Article], Error>) -> Void) {
        didCallGetData = true
    }
    
    func loadImage(from urlString: String?, completion: @escaping (Data?) -> Void) {
        
        if let imageData = UIImage(named: "sampleImage")?.pngData() {
            
            completion(imageData)
        } else {
            
            completion(nil)
        }
    }
    
}
