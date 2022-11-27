//
//  BaseResponse.swift
//  WeatherApp
//
//  Created by Ogün Birinci on 27.11.2022.
//

import Foundation

struct BaseResponse: Codable {
    let success: Bool
    let error: ErrorResponse
}

struct ErrorResponse: Codable {
    let code: Int
    let type: String
    let info: String
}

extension BaseResponse: LocalizedError {
    var errorDescription: String? {
        return error.info
    }
}
