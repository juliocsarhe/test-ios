//
//  LoginView.swift
//  test
//
//  Created by monica fatecha on 2022-05-19.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        Image("loginIcon")
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.gray, lineWidth: 4)
                    }
                    .shadow(radius: 7)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
