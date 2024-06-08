//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Thierno Diallo on 6/8/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    
    //passing in the username, pages and completion handler/closure to return an array of followers or error message
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endPoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            //Cases below will handle what happens if we get data, or response or error returned
            if let error = error { //error is checking for whether or not the request went through
                completed(.failure(.unableToComplete))
                return
            }
             //Status code 200 means the data is okay
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return //Checking if the correct response from the server came through
            }
            
            //Handling the bad cases first. If there is no error, will return nil. If error, will return the string value
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase // reference to decoding that data that doesn't follow the traditional camel casing
                
                let followers = try decoder.decode([Follower].self, from: data)
                // we will try and decode the data we get from the api into the codable Follower array
                completed(.success(followers)) // success everything went well. returned
            } catch {
                completed(.failure(.invalidData)) // failure, went bad
            }
        }
        
        task.resume()
    }
}
