//
//  SearchDefinitionPresenter.swift
//  NisumApp
//
//  Created by Josean Donato Jaulis Nina on 4/18/21.
//  Copyright © 2021 Josean Donato Jaulis Nina. All rights reserved.
//

import Foundation

class SearchDefinitionPresenter {
    
    private var view : SearchDefinitionsView?
    var abbrevation : String = ""
    var lstDefinitions : [Definition] = [Definition]()
    var interactor : AcromineInteractor
    
    init(){
        let repository = AcromineRepositoryImpl(apiRest: ApiRestImpl.instance)
        self.interactor = AcromineInteractorImpl(repository: repository)
    }
    
    func addView(view : SearchDefinitionsView){
        self.view = view
    }
    
    
    func searchAllDefinitions(text: String){
        
        self.interactor
            .searchAllDefinitions(abbreviation: text) {
                
                response in
                
                if response.isSuccess {
                    guard let lstResults = response.data, !lstResults.isEmpty, !lstResults[0].lfs.isEmpty else {
                        self.view?.showEmptyResult()
                        return
                    }
                    self.lstDefinitions = lstResults[0].lfs
                    self.view?.reloadTableview()
                } else {
                    self.view?.showEmptyResult()
                }
                
        }
        
        
    }
    
}


