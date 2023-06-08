//
//  RepoModel.swift
//  CarrefourChallenge
//
//  Created by Andre Lemos on 07/06/23.
//

import Foundation

struct RepoModel: Identifiable, Codable {
    var id: Int = 0
    var name: String = ""
    var fullName: String = ""
    var repoModelPrivate: Bool = false
    var owner: UserDetailModel = UserDetailModel()
    var htmlURL: String = ""
    var description: String? = nil
    var fork: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case repoModelPrivate = "private"
        case owner
        case htmlURL = "html_url"
        case description
        case fork
    }
}

