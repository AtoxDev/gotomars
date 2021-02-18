//
//  ListRockets.swift
//  GoToMars
//
//  Created by Jorge Tapia on 17/2/21.
//

import SwiftUI
import Kingfisher


struct ListRocket: View {
    
    private var presenter: RocketPresenter!
    private var geometryProxy: GeometryProxy!
    
    init(presenter: RocketPresenter, geometryProxy: GeometryProxy) {
        self.presenter = presenter
        self.geometryProxy = geometryProxy
    }
    
    var body: some View {
        
        HStack(spacing: 15) {
            KFImage(URL(string: self.presenter.image))
                .cancelOnDisappear(true)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(self.presenter.name)
                    .font(.custom("ITCKabelStd-Bold", size: 16))
                    .foregroundColor(Color.black)
            }
            
        }
    }
}
