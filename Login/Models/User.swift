 //
//  User.swift
//  Login
//
//  Created by Kseniya Semenova on 18.06.2025.
//

struct User {
    let login: String
    let password: String
    let person: Person

    static func getUserData() -> User {
        User(
            login: "ksushi",
            password: "123123",
            person: .getPerson())
    }

}

struct Person {
    let name: String
    let surname: String
    let image: String

    var fullName: String {
        "\(name) \(surname)"
    }

    static func getPerson() -> Person {
        Person(name: "Kseniya", surname: "Semenova", image: "UserIcon")
    }
}
