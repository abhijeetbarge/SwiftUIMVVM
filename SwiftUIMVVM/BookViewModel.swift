//
//  BookViewModel.swift
//  SwiftUIMVVM
//
//  Created by Abhijeet B Barge on 29/11/22.
//

import Foundation


class BookViewModel: Identifiable {
    
    let id = UUID()
    
    let book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    var title: String {
        return self.book.title
    }
    
    var description: String {
        return self.book.description ?? ""
    }
}
