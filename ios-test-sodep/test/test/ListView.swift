//
//  ListView.swift
//  test
//
//  Created by monica fatecha on 2022-05-19.
//

import Foundation
import SwiftUI

struct ListView: View {
    @State var tasks = [Task]()
    
    var body: some View {
        NavigationView{
            //se muestran lista de tareas con datos en duro por inconvenientes al realizar peticiones al servidor
        List(tasks) { task in
            Text("\(task.title)")
        }
        .onAppear(){
            getData()
//            loadData(completion: { tasks in
//                self.tasks = tasks
//            })
        }
        
        }.navigationTitle("Tasks")
    }
    
    func getData(){ //se carga manualmente las tareas
        let user = User(id: 2, login: "user", firstName: "User", lastName: "User", email: "user@localhost", activated: true, langKey: "en", imageURL: "", resetDate: "")
        if tasks.count == 0{
            for n in 1..<7 {
                tasks.append(Task(id: n, title: "Title task \(n)", taskDescription: "Description task \(n)", favorite: false, user: user))
            }
        }
        
        
    }
    
    func loadData(completion:@escaping ([Task]) -> ()) {
        guard let url = URL(string: Constants.String.baseUrl + "/api/tasks") else {
                print("Invalid url...")
                return
            }
        let json: [String: Any] = ["title": "Title demo" as Any,
                                   "description": "Title Task demo" as Any]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        let token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTY1NTc1NDcxNX0.gLecJGluphVrFpqBibbdv1P_dzAbgbwzFpnb3W9k2kaGGJop1Yno7MGem6mFH6HBq7Ep0yhbBD6RIxbRm8xErQ"//token generado en postman
        var request = URLRequest(url: url)
        request.addValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: url) { data, response, error in
            let tasks = try! JSONDecoder().decode([Task].self, from: data!)
                print(tasks)
            DispatchQueue.main.async {
                    completion(tasks)
            }
        }.resume()
            
        }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
