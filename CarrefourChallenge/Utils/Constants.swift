//
//  Constants.swift
//  CarrefourChallenge
//
//  Created by Andre Lemos on 06/06/23.
//

import Foundation

struct API {
    private static let url = "https://api.github.com"
    static let getUser = url + "/users"
    static let getUserDetails = url + "/users/"
    static let getRepo = "/repos"
}

struct Size {
    static let imageUserSize: CGFloat = 100
    static let imageUserDetailSize: CGFloat = 300
}

enum ApiState {
    case loading
    case loaded
    case failed
}

