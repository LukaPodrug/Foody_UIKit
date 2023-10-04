//
//  APIManager.swift
//  Foody - UIKit
//
//  Created by Luka Podrug on 05.09.2023..
//

import Foundation

enum ErrorType: Error {
    case network
    case decoding
    case unknown
}

class APIManager {
    static let shared: APIManager = APIManager()
    
    private let APIKey: String = "1"
    
    private func generateDataUrl(scriptName: String, queryItems: [URLQueryItem]?) -> URL {
        let baseUrl: String = "https://www.themealdb.com/api/json/v1"
        
        let fullUrl: String = baseUrl + "/" + APIKey + "/" + scriptName
        
        var url: URL = URL(string: fullUrl)!
        
        if queryItems != nil {
            url.append(queryItems: queryItems!)
        }
        
        return url
    }
    
    private func generateMealImageUrl(mealImageUrl: String, thumbnail: Bool?) -> URL {
        var fullUrl: String = mealImageUrl
        
        if thumbnail != nil && thumbnail == true {
            fullUrl = fullUrl + "/preview"
        }
        
        let url: URL = URL(string: fullUrl)!
        
        return url
    }
    
    func generateIngredientImageUrl(ingredientName: String, thumbnail: Bool?) -> URL {
        let baseUrl: String = "https://www.themealdb.com/images/ingredients"
        
        var fullUrl: String = baseUrl + "/" + ingredientName
        fullUrl = fullUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        if thumbnail != nil && thumbnail == true {
            fullUrl = fullUrl + "-Small.png"
        }
        else {
            fullUrl = fullUrl + ".png"
        }

        let url: URL = URL(string: fullUrl)!
        
        return url
    }
    
    func getMealDetailsById(id: String, completion: @escaping (Result<MealDetails, ErrorType>) -> Void) {
        let scriptName: String = "lookup.php"
        let queryItemName: String = "i"
        
        let queryItem: URLQueryItem = URLQueryItem(name: queryItemName, value: id)
        
        let url: URL = generateDataUrl(scriptName: scriptName, queryItems: [queryItem])
        
        let task: URLSessionTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(.network))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            if let mealCategories = try? jsonDecoder.decode(MealDetailsResponse.self, from: data) {
                completion(.success((mealCategories.meals?.first!)!))
                return
            } else {
                completion(.failure(.decoding))
                return
            }
        }
        
        task.resume()
    }
    
    func getMealCategoriesList(completion: @escaping (Result<[MealCategory], ErrorType>) -> Void) {
        let scriptName: String = "list.php"
        let queryItemName: String = "c"
        let queryItemValue: String = "list"
        
        let queryItem: URLQueryItem = URLQueryItem(name: queryItemName, value: queryItemValue)
        
        let url: URL = generateDataUrl(scriptName: scriptName, queryItems: [queryItem])
        
        let task: URLSessionTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(.network))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            if let mealCategories = try? jsonDecoder.decode(MealCategoriesResponse.self, from: data) {
                completion(.success(mealCategories.meals))
                return
            } else {
                completion(.failure(.decoding))
                return
            }
        }
        
        task.resume()
    }
    
    func getMealAreasList(completion: @escaping (Result<[MealArea], ErrorType>) -> Void) {
        let scriptName: String = "list.php"
        let queryItemName: String = "a"
        let queryItemValue: String = "list"
        
        let queryItem: URLQueryItem = URLQueryItem(name: queryItemName, value: queryItemValue)
        
        let url: URL = generateDataUrl(scriptName: scriptName, queryItems: [queryItem])
        
        let task: URLSessionTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(.network))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            if let mealAreasResponse = try? jsonDecoder.decode(MealAreasResponse.self, from: data) {
                completion(.success(mealAreasResponse.meals))
                return
            } else {
                completion(.failure(.decoding))
                return
            }
        }
        
        task.resume()
    }
    
    func getMealListByCategoryName(name: String, completion: @escaping (Result<[MealSummary], ErrorType>) -> Void) {
        let scriptName: String = "filter.php"
        let queryItemName: String = "c"
        
        let nameQueryItem: URLQueryItem = URLQueryItem(name: queryItemName, value: name)
        
        let url: URL = generateDataUrl(scriptName: scriptName, queryItems: [nameQueryItem])
        
        let task: URLSessionTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(.network))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            if let mealList = try? jsonDecoder.decode(MealListResponse.self, from: data) {
                completion(.success(mealList.meals ?? []))
                return
            } else {
                completion(.failure(.decoding))
                return
            }
        }
        
        task.resume()
    }
    
    func getMealListByAreaName(name: String, completion: @escaping (Result<[MealSummary], ErrorType>) -> Void) {
        let scriptName: String = "filter.php"
        let queryItemName: String = "a"
        
        let nameQueryItem: URLQueryItem = URLQueryItem(name: queryItemName, value: name)
        
        let url: URL = generateDataUrl(scriptName: scriptName, queryItems: [nameQueryItem])
        
        let task: URLSessionTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(.network))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            if let mealList = try? jsonDecoder.decode(MealListResponse.self, from: data) {
                completion(.success(mealList.meals ?? []))
                return
            } else {
                completion(.failure(.decoding))
                return
            }
        }
        
        task.resume()
    }
}
