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
    @State private var result: LoginModel!
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
                    loadData(completion: { response in
                        print(response)
                    })
                }.padding().border(.black, width: 2)
            }.padding(.horizontal, 72)
            
            Spacer(minLength: 60)
            Button("Create a new account"){
                
            }.padding()
            Button("Forgot my password"){
                
            }.padding()
        }
        
        
    }
    func loadData(completion:@escaping (LoginModel) -> ()) {
        let body: [String: Any] = ["password": "admin",
                                   "rememberMe": true,
                                   "username": "admin"]
        let jsonBody = try? JSONSerialization.data(withJSONObject: body)
        guard let url = URL(string: Constants.String.baseUrl + "/api/authenticate") else {
            print("Invalid url...")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("\(String(describing: jsonBody?.count))", forHTTPHeaderField: "Content-Length")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonBody
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            let loginModel = try! JSONDecoder().decode(LoginModel.self, from: data!)
            print(loginModel)
            DispatchQueue.main.async {
                completion(loginModel)
            }
        }.resume()
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
