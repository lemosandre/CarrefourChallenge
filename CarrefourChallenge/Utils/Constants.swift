//
//  Constants.swift
//  CarrefourChallenge
//
//  Created by Andre Lemos on 06/06/23.
//

import Foundation

struct API {
    static let getUser = "https://api.github.com/users"
}

enum ApiState {
    case loading
    case loaded
    case failed
}
