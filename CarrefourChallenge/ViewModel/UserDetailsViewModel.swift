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
    @Published var usersDetails = UserDetailModel()

    
    func getUsersDetails(userLogin: String) {
        AF.request(API.getUserDetails + userLogin, method: .get).responseDecodable(of: UserDetailModel.self) { response in
            switch response.result {
            case .success(let data):
                self.state = ApiState.loaded
                self.usersDetails = data
            case .failure(let error):
                self.state = ApiState.failed
                print(error)
            }
        }
    }
    
}
