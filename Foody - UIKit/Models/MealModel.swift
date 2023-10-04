//
//  MealModel.swift
//  Foody - UIKit
//
//  Created by Luka Podrug on 05.09.2023..
//

import Foundation

struct MealCategoriesResponse: Decodable {
    let meals: [MealCategory]
}

struct MealCategory: Decodable {
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case category = "strCategory"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.category = try container.decode(String.self, forKey: .category)
    }
}

struct MealAreasResponse: Decodable {
    let meals: [MealArea]
}

struct MealArea: Decodable {
    let area: String
    
    enum CodingKeys: String, CodingKey {
        case area = "strArea"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.area = try container.decode(String.self, forKey: .area)
    }
}

struct MealListResponse: Decodable {
    let meals: [MealSummary]?
}

struct MealSummary: Decodable {
    let id: String
    let name: String
    let thumbnailUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnailUrl = "strMealThumb"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
    }
}

struct MealDetailsResponse: Decodable {
    let meals: [MealDetails]?
}

struct MealDetails: Decodable {
    let id: String?
    let name: String?
    let category: String?
    let area: String?
    let instructions: String?
    let thumbnailUrl: String?
    let youtubeUrl: String?
    var tags: [String]?
    var ingredients: [String]?
    var measurements: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case thumbnailUrl = "strMealThumb"
        case youtubeUrl = "strYoutube"
        
        case tagsString = "strTags"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        case measurement1 = "strMeasure1"
        case measurement2 = "strMeasure2"
        case measurement3 = "strMeasure3"
        case measurement4 = "strMeasure4"
        case measurement5 = "strMeasure5"
        case measurement6 = "strMeasure6"
        case measurement7 = "strMeasure7"
        case measurement8 = "strMeasure8"
        case measurement9 = "strMeasure9"
        case measurement10 = "strMeasure10"
        case measurement11 = "strMeasure11"
        case measurement12 = "strMeasure12"
        case measurement13 = "strMeasure13"
        case measurement14 = "strMeasure14"
        case measurement15 = "strMeasure15"
        case measurement16 = "strMeasure16"
        case measurement17 = "strMeasure17"
        case measurement18 = "strMeasure18"
        case measurement19 = "strMeasure19"
        case measurement20 = "strMeasure20"
    }
    
    init() {
        self.id = ""
        self.name = ""
        self.category = ""
        self.area = ""
        self.instructions = ""
        self.thumbnailUrl = ""
        self.youtubeUrl = ""
        self.tags = []
        self.ingredients = []
        self.measurements = []
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String?.self, forKey: .id)
        self.name = try container.decode(String?.self, forKey: .name)
        self.category = try container.decode(String?.self, forKey: .category)
        self.area = try container.decode(String?.self, forKey: .area)
        self.instructions = try container.decode(String?.self, forKey: .instructions)
        self.thumbnailUrl = try container.decode(String?.self, forKey: .thumbnailUrl)
        self.youtubeUrl = try container.decode(String?.self, forKey: .youtubeUrl)
        
        let strTags = try container.decode(String?.self, forKey: .tagsString)
        
        self.tags = strTags?.components(separatedBy: ",")
        
        self.ingredients = []
        self.measurements = []
        
        (1...20).forEach({ index in
            let ingredientKeyIndex: String = "strIngredient\(index)"
            let measurementKeyIndex: String = "strMeasure\(index)"
            
            guard let ingredientKey: MealDetails.CodingKeys = CodingKeys(rawValue: ingredientKeyIndex) else {
                print("Coding Key not found")
                return
            }
            guard let measurementKey: MealDetails.CodingKeys = CodingKeys(rawValue: measurementKeyIndex) else {
                print("Coding Key not found")
                return
            }
            
            do {
                let ingredient: String? = try container.decode(String.self, forKey: ingredientKey)
                let measurement: String? = try container.decode(String.self, forKey: measurementKey)
                
                
                guard ingredient != nil else {
                    return
                }
                
                guard measurement != nil else {
                    return
                }
                
                guard ingredient!.isEmpty == false else {
                    return
                }
                
                guard measurement!.isEmpty == false else {
                    return
                }
                
                guard ingredient!.first != " " else {
                    return
                }
                
                guard measurement!.first != " " else {
                    return
                }
                
                self.ingredients?.append(ingredient!)
                self.measurements?.append(measurement!)
            }
            catch {
                return
            }
        })
    }
}
