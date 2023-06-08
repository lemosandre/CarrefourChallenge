//
//  RepoViewModel.swift
//  CarrefourChallenge
//
//  Created by Andre Lemos on 07/06/23.
//

import Foundation
import Alamofire

class RepoViewModel: ObservableObject {
    
    @Published var state = ApiState.loading
    @Published var repos = [RepoModel]()
    
    func getRepo(userLogin: String) {
        AF.request(API.getUserDetails + userLogin + API.getRepo , method: .get).responseDecodable(of: [RepoModel].self) { response in
            switch response.result {
            case .success(let data):
                self.state = ApiState.loaded
                self.repos = data
            case .failure(let error):
                self.state = ApiState.failed
                print(error)
            }
        }
    }
    
}
