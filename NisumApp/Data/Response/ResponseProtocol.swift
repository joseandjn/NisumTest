//
//  CallbackResponse.swift
//  NisumApp
//
//  Created by Josean Donato Jaulis Nina on 4/19/21.
//  Copyright © 2021 Josean Donato Jaulis Nina. All rights reserved.
//

import Foundation
protocol ResponseProtocol : NSObject {
    func onSuccess<T : Decodable>(response : T)
    func onError(error : Error)
}
