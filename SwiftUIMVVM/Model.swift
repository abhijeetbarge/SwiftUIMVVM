//
//  Model.swift
//  SwiftUIMVVM
//
//  Created by Abhijeet B Barge on 29/11/22.
//

import Foundation

import Foundation

struct BooksData: Codable {
    let books: [Book]?
}

struct Book: Codable {
    let title: String
    let description: String?
}
