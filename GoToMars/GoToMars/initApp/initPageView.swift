//
//  initPageView.swift
//  GoToMars
//
//  Created by Jorge Tapia on 16/2/21.
//

import SwiftUI

struct initPageView: View {
    
    @State var show = false;
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        NavigationView {
            VStack {
                
                if self.status {
                    RocketPageView()
                } else {
                    NavigationLink(destination: RegisterPageView(show: self.$show), isActive:
                                    self.$show) {
                        Text("")
                    }.hidden()
                    
                    LoginPageView(show: self.$show)
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear{
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) {
                    (_) in
                    
                    self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                }
            }
        }
    }
}

struct initPageView_Previews: PreviewProvider {
    static var previews: some View {
        initPageView()
    }
}
