//
//  LoginView.swift
//  test
//
//  Created by monica fatecha on 2022-05-19.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = "username"
    @State private var password: String = "password"
    var body: some View {
        VStack{
            Image("loginIcon").resizable()
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.gray, lineWidth: 4)
                        }.frame(width: 150, height: 150, alignment: .center)
                .shadow(radius: 7).padding(30)
            Spacer()
            VStack {
                TextField("username", text: $username).cornerRadius(5.0).multilineTextAlignment(.center)
                Divider()
                 .frame(height: 1)
                 .padding(.horizontal, 30)
                 .background(.black)
                 .padding(.bottom, 15)
                SecureField("password", text: $password).cornerRadius(5.0).multilineTextAlignment(.center)
                Divider()
                 .frame(height: 1)
                 .padding(.horizontal, 30)
                 .background(.black)
                 .padding(.bottom, 30)
                Button("Sign in"){
                    
                }
            }.padding(.horizontal, 72)
            
            Spacer(minLength: 60)
            Button("Create a new account"){
                
            }.padding()
            Button("Forgot my password"){
                
            }.padding()
        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
