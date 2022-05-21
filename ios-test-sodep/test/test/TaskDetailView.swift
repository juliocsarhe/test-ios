//
//  TaskDetailView.swift
//  test
//
//  Created by Julio Hermosa on 2022-05-21.
//

import SwiftUI

struct TaskDetailView: View {
    @State var task: Task
    @State var newTitle:String = ""
    @State var newDescription:String = ""
    var body: some View {
        VStack {
            VStack {
                HStack{
                    Text("Title")
                    TextField(task.title, text: $newTitle)
                }
                Text("Description").multilineTextAlignment(.leading)
                TextField(task.taskDescription, text: $newDescription)
                Spacer()
            }
            Spacer()
            Button("Save"){
                //consumir servicio para editar
            }.padding(10)
                .border(.black, width: 2)
            
        }.padding()
        
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: Task(id: 1, title: "Title task", taskDescription: "Description task", favorite: false, user: User(id: 1, login: "", firstName: "", lastName: "", email: "", activated: false, langKey: "", imageURL: "", resetDate: "")))
    }
}
