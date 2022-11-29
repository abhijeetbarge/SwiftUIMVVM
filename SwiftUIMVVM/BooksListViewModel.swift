//
//  BooksListViewModel.swift
//  SwiftUIMVVM
//
//  Created by Abhijeet B Barge on 29/11/22.
//

import Foundation
import Combine

class BooksListViewModel: ObservableObject {
    
    let didChange = PassthroughSubject<BooksListViewModel,Never>()
    let networkManager = NetworkManager()
    init() {
        fetchBooks()
    }
    
    @Published var booksVM = [BookViewModel]() {
        didSet {
            didChange.send(self)
        }
    }
    
    private func fetchBooks() {
        
        guard let url =  Bundle.main.url(forResource: "data", withExtension: "json") else {
            fatalError("URL is not correct")
        }
        
        networkManager.getData(url: url) { data, error in
            guard let responseData = data  else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(BooksData.self, from: responseData)
                DispatchQueue.main.async {
                    if let books = response.books {
                        self.booksVM = books.map(BookViewModel.init)
                    }
                }
            } catch {
                print(error)
            }
            
        }
    }
    
}
