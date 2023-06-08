//
//  RepoView.swift
//  CarrefourChallenge
//
//  Created by Andre Lemos on 07/06/23.
//

import SwiftUI

struct RepoView: View {
    
    @ObservedObject var model = RepoViewModel()
    let userLogin: String

    var body: some View {
        switch model.state {
        case ApiState.loaded:
            if model.repos.isEmpty {
                    VStack{
                        Text("repo.empaty")
                            .font(.title2)
                    }.navigationTitle("repo.title")
            } else {
                List(model.repos) { element in
                    VStack{
                        Text(element.name)
                    }
                }.navigationTitle("repo.title")
            }
        case ApiState.loading:
            ProgressView()
                .onAppear(perform: {
                model.getRepo(userLogin: userLogin)
            })
        case .failed:
            ErrorView()
        }
    }
}

struct RepoView_Previews: PreviewProvider {
    static var previews: some View {
        RepoView(userLogin: "torvalds")
    }
}
