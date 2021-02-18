//
//  RocketDetaiViewModel.swift
//  GoToMars
//
//  Created by Jorge Tapia on 17/2/21.
//

import Foundation

final class RocketDetaiViewModel: ObservableObject {
    
    @Published var presenter: RocketDetailPresenter?
    
    init() {
        
    }
    
    init(with model: RocketModel) {
        self.presenter = RocketDetailPresenter(with: model)
    }
    
}
