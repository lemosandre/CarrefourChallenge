//
//  UserView.swift
//  CarrefourChallenge
//
//  Created by Andre Lemos on 06/06/23.
//

import SwiftUI

struct UserView: View {
    @ObservedObject var model = UserViewModel()

    var body: some View {
        switch model.state {
        case ApiState.loaded:
            NavigationView {
                
                List(model.users) { element in
                    ZStack {
                        NavigationLink(destination: UserDetailsView(userLogin: element.login)) {
                            AsyncImage(
                                url: URL(string: element.avatarURL),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: Size.imageUserSize, maxHeight: Size.imageUserSize)
                                        .clipShape(Circle())
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                            .frame(width: Size.imageUserSize, height: Size.imageUserSize)
                            
                            Text(element.login)
                                .bold()
                            
                        }
                    }
                }
                .navigationTitle("user.title")
            }
        case ApiState.loading:
            ProgressView()
        case .failed:
            ErrorView()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
