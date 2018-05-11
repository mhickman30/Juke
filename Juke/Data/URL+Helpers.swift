//
//  URL+Helpers.swift
//  Juke
//
//  Created by Student on 5/11/18.
//  Copyright © 2018 Matt Hickman. All rights reserved.
//

import Foundation

extension URL {
    
    func withQueries(_ queries: [String: String]) -> URL? {
        
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
