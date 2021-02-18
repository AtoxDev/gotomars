//
//  ServiceError.swift
//  GoToMars
//
//  Created by Jorge Tapia on 17/2/21.
//

import Foundation
import Alamofire

enum ServiceError: Error {
    case network
    
    init(error: AFError) {
        self = .network
    }
}
