//
//  RocketDetailPresenters.swift
//  GoToMars
//
//  Created by Jorge Tapia on 17/2/21.
//

import Foundation

struct RocketDetailPresenter {
    
    let image: String
    let name: String
    let information: String
    
    init(with model: RocketModel) {
        self.image  = model.images?.first ?? ""
        self.name = model.name ?? ""
        self.information = model.information ?? ""
    }
    
}
