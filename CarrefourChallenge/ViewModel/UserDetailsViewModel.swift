//
//  UserDetailsViewModel.swift
//  CarrefourChallenge
//
//  Created by Andre Lemos on 06/06/23.
//

import Foundation
import Alamofire

class UserDetailsViewModel: ObservableObject {
    
    @Published var state = ApiState.loading
    @Published var users = [UserModel]()

    init() {
        getUsers()
    }
    
    func getUsers() {
        AF.request(API.getUser, method: .get).responseDecodable(of: [UserModel].self) { response in
            switch response.result {
            case .success(let data):
                self.state = ApiState.loaded
                self.users = data
            case .failure(let error):
                self.state = ApiState.failed
                print(error)
            }
        }
    }
    
}
