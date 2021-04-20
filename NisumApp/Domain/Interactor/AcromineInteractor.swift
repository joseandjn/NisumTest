//
//  AcromineInteractor.swift
//  NisumApp
//
//  Created by Josean Donato Jaulis Nina on 4/18/21.
//  Copyright © 2021 Josean Donato Jaulis Nina. All rights reserved.
//

import Foundation

protocol AcromineInteractor {
    func searchAllDefinitions(abbreviation: String, callback : @escaping (ResponseGeneric<[AcromineResponse]>)->())
}

class AcromineInteractorImpl : AcromineInteractor {
    
    
    
    var repository : AcromineRepository
    
    init(repository : AcromineRepository) {
        self.repository = repository
    }
    
    func searchAllDefinitions(abbreviation: String, callback: @escaping (ResponseGeneric<[AcromineResponse]>) -> ()) {
        
        self.repository.searchAllDefinitions(abbreviation: abbreviation, callback: callback)
    }

}
