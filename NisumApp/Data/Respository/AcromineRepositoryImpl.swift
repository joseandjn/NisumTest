//
//  AcromineRepositoryImpl.swift
//  NisumApp
//
//  Created by Josean Donato Jaulis Nina on 4/20/21.
//  Copyright © 2021 Josean Donato Jaulis Nina. All rights reserved.
//

import Foundation

class AcromineRepositoryImpl : AcromineRepository {
    
    
    var apiRest : ApiRest
    
    init(apiRest : ApiRest) {
        self.apiRest = apiRest
    }
    
    
    func searchAllDefinitions(abbreviation: String, callback: @escaping (ResponseGeneric<[AcromineResponse]>) -> ()) {
        
        let url = URLBuilder()
            .urlBase()
            .path(.GET_DEFINITION_ACROMINE)
            .param("shortForm", abbreviation)
            .build()
        self.apiRest.callRestAPI(url: url, method: .get, callback: callback)
    }

}
