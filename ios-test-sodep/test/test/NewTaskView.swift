//
//  NewTaskView.swift
//  test
//
//  Created by Julio Hermosa on 2022-05-21.
//

import SwiftUI

struct NewTaskView: View {
    @State var newTitle: String = ""
    @State var newDescription: String = ""
    var body: some View {
        VStack {
            VStack {
                HStack{
                    Text("Title")
                    TextField("", text: $newTitle)
                }
                Text("Description")
                TextField("", text: $newDescription)
                Spacer()
            }
            Spacer()
            Button("Save"){
                //consumir servicio para guardar
            }.padding(10)
                .border(.black, width: 2)
            
        }.padding()
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
    }
}
