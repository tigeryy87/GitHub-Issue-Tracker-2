//
//  Models.swift
//  module-7-github-issues-swiftui
//
//  Created by Andrew Binkowski on 2/22/22.
//

import Foundation

struct GitHubUser: Codable {
    let login: String
    let avatarUrl: String?
}

struct GitHubIssue: Codable, Identifiable {
    let title: String?
    // We can use GitHub to conformt to `Identifiable`
    let id: UInt32?
    let createdAt: String?
    let body: String?
    let state: String?
    let user: GitHubUser
}
let testData = [GitHubIssue(title: "title", id: 0, createdAt: "2023-02-21T08:09:33Z", body: "body", state: "open", user: GitHubUser(login: "login", avatarUrl: "url"))]
