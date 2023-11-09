//
//  ObjectMapper.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/9/23.
//

import Foundation

//class ObjectMapper {
//    func map<T: Codable>(json: Data) throws -> T? {
//        
//        let decoder = JSONDecoder()
//        
//        do {
//            let result: T? = try decoder.decode(T.self, from: json)
//
//            if let result = result {
//                return result
//            } else {
//                log.error("Error ObjectMapper decode nil returned")
//                return nil
//            }
//        } catch {
//            log.error("Error ObjectMapper decode fail \(error)")
//            throw error
//        }
//    }
//}
