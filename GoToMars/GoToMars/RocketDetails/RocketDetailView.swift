//
//  RocketDetailView.swift
//  GoToMars
//
//  Created by Jorge Tapia on 17/2/21.
//

import SwiftUI
import Kingfisher

struct RocketDetailView: View {
    
    @ObservedObject var viewModel: RocketDetaiViewModel = RocketDetaiViewModel()
    
    var body: some View {
        GeometryReader { geometryReader in
            ScrollView {
                
                VStack{
                    VStack{
                        Text(self.viewModel.presenter?.name ?? "")
                            .font(.custom("ITCKabelStd-Bold", size: 36))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                            .padding(.top, 100)
                        
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 600)
                        .background(
                            KFImage(URL(string: self.viewModel.presenter?.image ?? ""))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        )
                    Spacer()
                }.ignoresSafeArea()
                
                VStack{
                    Text(self.viewModel.presenter?.information ?? "")
                        .font(.custom("ITCKabelStd-Book", size: 16))
                }.padding(25)
            }
        }
    }
}

struct RocketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RocketDetailView()
    }
}
