//
//  AcronymoRepositoryImpl.swift
//  NisumApp
//
//  Created by Josean Donato Jaulis Nina on 4/18/21.
//  Copyright © 2021 Josean Donato Jaulis Nina. All rights reserved.
//

import Foundation
import Alamofire

class AcronymoRepositoryImpl : AcronymoRepository {
    
    var apiRest : ApiRest
    
    init(apiRest : ApiRest) {
        self.apiRest = apiRest
    }
    
  
    func searchAllDefinitions(abbreviation: String, callback: ResponseProtocol) {
        
              let url = URLBuilder()
                  .urlBase()
                  .path(.GET_DEFINITION_ACROMINE)
                  .param("shortForm", abbreviation)
              
              
        self.apiRest.callRestAPI(url: url, t: Abbreviation, method: .get, callback: callback)
    }
}
