//
//  ApiRest.swift
//  NisumApp
//
//  Created by Josean Donato Jaulis Nina on 4/18/21.
//  Copyright © 2021 Josean Donato Jaulis Nina. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiRest {
    func callRestAPI<T : Decodable>(url : String, method : HTTPMethod, callback :  @escaping (ResponseGeneric<[T]>)->())
    
    func callRestAPI<T : Decodable>(url : String, method : HTTPMethod, callback :  @escaping (ResponseGeneric<T>)->())
    
}

class ApiRestImpl: ApiRest {
    
    public static let instance = ApiRestImpl()
    
    var alamofireManager: Alamofire.Session
    
    private init(){
        let configuration = URLSessionConfiguration.default
        self.alamofireManager = Alamofire.Session(configuration: configuration)
    }
    func callRestAPI<T>(url: String, method: HTTPMethod, callback: @escaping (ResponseGeneric<[T]>) -> ()) where T : Decodable {
        
        self.alamofireManager.request(url)
            .responseDecodable { (dataResponse : DataResponse<[T], AFError>) in
                
                let responseGeneric = ResponseGeneric<[T]>()
                
                switch dataResponse.result {
                case .success(let value):
                    responseGeneric.isSuccess = true
                    responseGeneric.data = value
                    break
                    
                case .failure(let error):
                    responseGeneric.isSuccess = false
                    responseGeneric.error = error
                    
                    break
                }
                
                callback(responseGeneric)
                
        }
    }
    
    func callRestAPI<T>(url: String, method: HTTPMethod, callback: @escaping (ResponseGeneric<T>) -> ()) where T : Decodable {
        
        self.alamofireManager.request(url)
            .responseDecodable { (dataResponse : DataResponse<T, AFError>) in
                
                let responseGeneric = ResponseGeneric<T>()
            
                switch dataResponse.result {
                case .success(let value):
                    responseGeneric.isSuccess = true
                    responseGeneric.data = value
                    
                    break
                    
                case .failure(let error):
                    responseGeneric.isSuccess = false
                    responseGeneric.error = error
                    
                    break
                }
                
                callback(responseGeneric)
                
        }
    }
    
}
