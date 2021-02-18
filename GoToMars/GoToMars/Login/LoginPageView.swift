//
//  LoginPageView.swift
//  GoToMars
//
//  Created by Jorge Tapia on 15/2/21.
//

import SwiftUI
import Firebase

struct LoginPageView: View {
    
    @StateObject private var kb = KeyboardHandler()
    
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        
        // Vertical Stack Background
        VStack{
            VStack{
                VStack{
                    Text("Welcome to")
                        .font(.custom("ITCKabelStd-Book", size: 40))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, maxHeight: 70, alignment: .top)
                        .padding(.top, 130)
                        .animation(Animation.easeOut.delay(0.1))
                    
                    Text("GoToMars")
                        .font(.custom("ITCKabelStd-Bold", size: 54))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 500)
                    .background(
                        Image(uiImage: #imageLiteral(resourceName: "bg_login"))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    )
                Spacer()
            }.ignoresSafeArea()
            .padding(.bottom, 20)
        
            
            VStack {
                // Vertica Stack inputs
                VStack{
                    if self.alert{
                        Text(self.error)
                            .font(.custom("ITCKabelStd-Bold", size: 16))
                            .foregroundColor(Color.red)
                            .frame(width: UIScreen.main.bounds.width - 25, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(10)
                    }
                    
                    HStack(spacing: 15){
                        Image(systemName: "envelope")
                            .foregroundColor(.black)
                        
                        TextField("Enter Email Address", text: self.$email)
                            .font(.custom("ITCKabelStd-Book", size: 14))
                    }.padding(.vertical, 20)
                    .onTapGesture {
                        self.alert = false
                    }
                    
                    Divider()
                    
                    HStack(spacing: 15){
                        Image(systemName: "lock")
                            .foregroundColor(.black)
                            .frame(width: 15, height: 18)
                        
                        if self.visible {
                            TextField("Password", text: self.$pass)
                                .font(.custom("ITCKabelStd-Book", size: 14))
                        } else {
                            SecureField("Password", text: self.$pass)
                                .font(.custom("ITCKabelStd-Book", size: 14))
                        }
                        
                        Button(action: {
                            self.visible.toggle()
                        }) {
                            Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.black)
                            
                        }
                        
                    }.padding(.vertical, 20)
                    .onTapGesture {
                        self.alert = false
                    }
                    
                    HStack(spacing: 15){
                        Button(action: {
                            self.verify()
                        }) {
                            
                            Text("LOG IN")
                                .foregroundColor(.white)
                                .font(.custom("ITCKabelStd-Bold", size: 24))
                                .padding(.vertical, 25)
                                .frame(maxWidth: .infinity, maxHeight: 70, alignment: .top)
                            
                        }.background(
                        
                            LinearGradient(gradient: .init(colors: [Color("Color2"),Color("Color1"),Color("Color")]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 1)
                    }
                    
                }
                .padding(.vertical)
                .padding(.horizontal, 20)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 1)
                Spacer()
                
                HStack{
                    // boton register
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Text("Register")
                            .font(.custom("ITCKabelStd-Book", size: 16))
                            .foregroundColor(Color.black)
                    }
                }.padding(.top, 25)

                
            }
            .padding(.vertical)
            .padding(.horizontal, 10)
            .animation(.default)
            .padding(.bottom, (kb.keyboardHeight/2) + 50)
            
        }
    }
    
    func verify(){
        if self.email == "" && self.pass == "" {
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
        } else {
            Auth.auth().signIn(withEmail: self.email, password: self.pass) {
                (res, err) in
                
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
        }
    }
}

/*
struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView(self.show)
    }
}
*/
