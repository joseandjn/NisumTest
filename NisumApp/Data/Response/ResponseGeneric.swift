//
//  ResponseGeneric.swift
//  NisumApp
//
//  Created by Josean Donato Jaulis Nina on 4/19/21.
//  Copyright © 2021 Josean Donato Jaulis Nina. All rights reserved.
//

import Foundation
class ResponseGeneric<T : Decodable> {
    var isSuccess : Bool = false
    var data : T?
    var error : Error?
}
