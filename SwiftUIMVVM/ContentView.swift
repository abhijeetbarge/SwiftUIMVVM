//
//  ContentView.swift
//  SwiftUIMVVM
//
//  Created by Abhijeet B Barge on 29/11/22.
//

import SwiftUI
import Combine

struct ContentView : View {
    @StateObject var model = BooksListViewModel()
    
    var body: some View {
        List(model.booksVM) { book in
            VStack(alignment: .leading) {
                Text(book.title)
                    .lineLimit(nil)
                Text(book.description)
                    .foregroundColor(.secondary)
                    .lineLimit(nil)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
