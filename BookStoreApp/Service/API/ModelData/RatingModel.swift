//
//  RatingModel.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 14.12.23.
//

import Foundation

// MARK: - RatingsModel
struct RatingsModel: Codable {
    let summary: Summary
}

// MARK: - Summary
struct Summary: Codable {
    let average: Double
}
