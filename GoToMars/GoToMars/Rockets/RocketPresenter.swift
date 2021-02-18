//
//  RocketPresenter.swift
//  GoToMars
//
//  Created by Jorge Tapia on 17/2/21.
//

import Foundation

struct RocketPresenter: Identifiable {
    
    let id = UUID()
    let image: String
    let name: String
    
    init(with model: RocketModel) {
        self.image  = model.images?.first ?? ""
        self.name = model.name ?? ""
    }
    
}
