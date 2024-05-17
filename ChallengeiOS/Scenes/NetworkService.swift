//
//  NetworkService.swift
//  ChallengeiOS
//
//  Created by Evandro Rodrigo Minamoto on 11/05/24.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func getData(keyword: String, completion: @escaping (Result<[Article], Error>) -> Void)
    func loadImage(from urlString: String?, completion: @escaping (Data?) -> Void)
}

class NetworkService: NetworkServiceProtocol{
    
    // MARK: - Public Methods
    func getData(keyword: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        let apiKey = "7197eadf7eec47be9bd182c75b7ef5e9"
        let urlString = "https://newsapi.org/v2/everything?q=\(keyword)&apiKey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "URL inválida", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "Erro na resposta do servidor", code: 0, userInfo: nil)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Dados inválidos", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(NewsResponse.self, from: data)
                completion(.success(response.articles))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func loadImage(from urlString: String?, completion: @escaping (Data?) -> Void) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            completion(data)
        }.resume()
    }
    
}
