//
//  UserDetailsView.swift
//  CarrefourChallenge
//
//  Created by Andre Lemos on 06/06/23.
//

import SwiftUI

struct UserDetailsView: View {
    
    @ObservedObject var model = UserDetailsViewModel()
    let userLogin: String
    
    var body: some View {
        switch model.state {
        case ApiState.loaded:
            ZStack {
                VStack {
                    AsyncImage(
                        url: URL(string: model.usersDetails.avatarURL),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: Size.imageUserDetailSize, maxHeight: Size.imageUserDetailSize)
                                .clipShape(Circle())
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    .frame(width: Size.imageUserDetailSize, height: Size.imageUserDetailSize)
                    
                    HStack {
                        Text("userdetails.login")
                            .font(.subheadline)
                        Text(model.usersDetails.login)
                            .bold()
                    }
                    if model.usersDetails.name != nil {
                        HStack {
                            Text("userdetails.name")
                                .font(.subheadline)
                            Text(model.usersDetails.name!)
                                .bold()
                        }
                    }
                    
                    if model.usersDetails.location != nil {
                        HStack {
                            Text("userdetails.location")
                                .font(.subheadline)
                            Text(model.usersDetails.location!)
                                .bold()
                        }
                    }
                    
                    if model.usersDetails.company != nil {
                        HStack {
                            Text("userdetails.company")
                                .font(.subheadline)
                            Text(model.usersDetails.company!)
                                .bold()
                        }
                    }
                    if model.usersDetails.publicRepos != nil {
                        HStack {
                            Text("userdetails.public.repos")
                                .font(.subheadline)
                            Text("\(model.usersDetails.publicRepos!)")
                                .bold()
                        }
                    }
                    NavigationLink(destination: RepoView(userLogin: model.usersDetails.login)) {
                        HStack {
                            Image(systemName: "icloud.and.arrow.up")
                            Text("userdetails.repo")
                        }
                    }
                    .padding()
                    Spacer()
                }.padding()
            }
        case ApiState.loading:
            ProgressView()
                .onAppear(perform: {
                model.getUsersDetails(userLogin: userLogin)
            })
        case .failed:
            ErrorView()
        }
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(userLogin: "torvalds")
    }
}

