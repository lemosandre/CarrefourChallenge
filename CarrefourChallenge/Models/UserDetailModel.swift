//
//  UserDetailModel.swift
//  CarrefourChallenge
//
//  Created by Andre Lemos on 07/06/23.
//

import Foundation

struct UserDetailModel: Identifiable, Codable {
    var login: String = ""
    var id: Int = 0
    var avatarURL: String = ""
    var name: String? = nil
    var location: String? = nil
    var company: String? = nil
    var publicRepos: Int? = nil
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case name
        case location
        case company
        case publicRepos = "public_repos"
    }
}

