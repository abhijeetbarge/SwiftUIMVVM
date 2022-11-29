//
//  NetworkManager.swift
//  SwiftUIMVVM
//
//  Created by Abhijeet B Barge on 29/11/22.
//
import Foundation


class NetworkManager {
    
    func getData(url: URL, completion: @escaping (Data?, Error?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            let str = String(decoding: data, as: UTF8.self)
            print("Response: \(str)")
            completion(data, nil)
        }.resume()
    }
}

