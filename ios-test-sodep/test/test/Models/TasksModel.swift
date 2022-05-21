//
//  TasksModel.swift
//  test
//
//  Created by Julio Hermosa on 2022-05-21.
//

import Foundation

struct Task: Codable, Identifiable {
    let id: Int
    let title, taskDescription: String
    let favorite: Bool
    let user: User
}

struct User: Codable {
    let id: Int
    let login, firstName, lastName, email: String
    let activated: Bool
    let langKey, imageURL: String
    let resetDate: String
}
