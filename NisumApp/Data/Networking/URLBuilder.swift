//
//  URLBuilder.swift
//  NisumApp
//
//  Created by Josean Donato Jaulis Nina on 4/18/21.
//  Copyright © 2021 Josean Donato Jaulis Nina. All rights reserved.
//

import Foundation

enum ServicePath : String {
    case GET_DEFINITION_ACROMINE = "acromine/dictionary.py?sf={shortForm}"
}

class URLBuilder {
    
    private var host : String = ""
    private var path : String = ""


    func urlBase() -> URLBuilder {
        self.host = Configuration.URL_BASE
        return self
    }
    func path(_ path : ServicePath) -> URLBuilder {
        self.path = path.rawValue
        return self
    }
    
    
    func build() -> String {
        let url = "\(self.host)\(self.path)"
        return url
    }

    func param(_ key: String, _ value : String) -> URLBuilder {
        self.path = self.path.replacingOccurrences(of: "{\(key)}", with: value)
        return self
    }
}
