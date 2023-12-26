//
//  Data.swift
//  FoundationUtility
//
//  Created by Kim Do hyung on 12/26/23.
//  Copyright © 2023 shapiro. All rights reserved.
//

import Foundation

public extension Data {
    /// Data -> UTF-8 string으로 변환.
    func toString() -> String? {
        return String(data: self, encoding: .utf8)
    }
    
    func toJSONObject() -> Any? {
        return try? JSONSerialization.jsonObject(with: self, options: [])
    }
    
    func toPrettyPrintJSONString() -> String? {
        guard let jsonObject = toJSONObject() else { return nil }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            return jsonData.toString()
        } catch {
            return nil
        }
    }
}
