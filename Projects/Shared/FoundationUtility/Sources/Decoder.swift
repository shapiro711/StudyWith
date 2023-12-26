//
//  Decoder.swift
//  FoundationUtility
//
//  Created by Kim Do hyung on 12/26/23.
//  Copyright © 2023 shapiro. All rights reserved.
//

import Foundation

func decodeJSON<T: Decodable>(type: T.Type, from jsonData: Data) throws -> T {
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: jsonData)
}
