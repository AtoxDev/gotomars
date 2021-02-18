//
//  RocketPageView.swift
//  GoToMars
//
//  Created by Jorge Tapia on 16/2/21.
//

import SwiftUI
import Firebase

struct RocketPageView: View {
    
    @ObservedObject private var viewModel: RocketViewModel = RocketViewModel()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont(name: "ITCKabelStd-Bold", size: 26) as Any]
    }
    
    var body: some View {
        
        GeometryReader { geometryReader in
            NavigationView {
                VStack {
                    List(self.viewModel.presenters) { item in
                        ListRocket(presenter: item, geometryProxy:
                                    geometryReader).onTapGesture(perform: {
                                        self.viewModel.itemSelected(at: item)
                                    })
                    }.onAppear(perform: {
                        self.viewModel.onAppear()
                    }).listStyle(PlainListStyle())
                    
                    NavigationLink(
                        destination: RocketDetailView(viewModel: self.viewModel.selectedViewModel),
                        isActive: self.$viewModel.navigateToDetail,
                        label: {
                            EmptyView()
                        }
                    )
                    
                }.navigationBarTitle(Text("Rockets"), displayMode: .large)
            }
            
        }
        
        HStack(spacing: 15){
            Button(action: {
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }) {
                
                Text("LOG OUT")
                    .foregroundColor(.white)
                    .font(.custom("ITCKabelStd-Bold", size: 24))
                    .padding(.vertical, 25)
                    .frame(maxWidth: .infinity, maxHeight: 70, alignment: .top)
                
            }.background(
            
                LinearGradient(gradient: .init(colors: [Color("Color2"),Color("Color1"),Color("Color")]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 1)
        }.padding(15)
    }
}
