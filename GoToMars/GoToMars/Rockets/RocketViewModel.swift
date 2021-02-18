//
//  RocketViewMode.swift
//  GoToMars
//
//  Created by Jorge Tapia on 17/2/21.
//

import Foundation
import Combine

final class RocketViewModel: NSObject, ObservableObject {
    
    private var task: Cancellable? = nil
    private var rockets: [RocketModel] = []
    @Published var presenters: [RocketPresenter] = []
    @Published var selectedViewModel: RocketDetaiViewModel = RocketDetaiViewModel()
    @Published var navigateToDetail: Bool = false
    
    func onAppear(){
        self.task = Service.standard.get(path: .rockets, responseType: [RocketModel].self)
            .map { [weak self] in
                self?.rockets = $0
                return $0.map { RocketPresenter(with: $0) }
            }
            .sink(receiveCompletion: { _ in}, receiveValue: { [weak self] (presenters) in
                self?.presenters = presenters
            })
    }
    
    func itemSelected(at item: RocketPresenter) {
        guard let index = self.presenters.firstIndex(where: { $0.id == item.id }) else { return }
        self.selectedViewModel = RocketDetaiViewModel(with: self.rockets[index])
        self.navigateToDetail = true
    }
    
}
