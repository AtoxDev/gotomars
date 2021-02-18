//
//  ErrorLogin.swift
//  GoToMars
//
//  Created by Jorge Tapia on 16/2/21.
//

import SwiftUI

struct ErrorLogin: View {
    
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error: String
    
    var body: some View {
        ZStack{
        GeometryReader{_ in
            VStack(alignment: .leading, spacing: 15){
                Text("¡Oops!")
                    .font(.custom("ITCKabelStd-Book", size: 40))
                    .foregroundColor(self.color)
                
                Text(self.error)
                    .foregroundColor(self.color)
                    .font(.custom("ITCKabelStd-Book", size: 40))
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                Button(action: {
                    self.alert.toggle()
                }) {
                    Text("OK")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }.background(Color("Color"))
                    .cornerRadius(10)
                    .padding(.top, 25)
                
                }
            }
        }.background(Color.black.opacity(0.65))
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            withAnimation {
                self.alert.toggle()
                }
            }
    }
}
