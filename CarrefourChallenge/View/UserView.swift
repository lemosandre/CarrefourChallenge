//
//  UserView.swift
//  CarrefourChallenge
//
//  Created by Andre Lemos on 06/06/23.
//

import SwiftUI

struct UserView: View {
    @ObservedObject var userModel = UserViewModel()

    var body: some View {
        switch userModel.state {
        case ApiState.loaded:
            NavigationView {
                
                List(userModel.users) { element in
                    HStack {
                        NavigationLink(destination: UserDetailsView()) {
                            AsyncImage(
                                url: URL(string: element.avatarURL),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 100, maxHeight: 100)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                            .frame(width: 100, height: 100)
                            .background(Color.gray)
                            Text(element.login)
                                .bold()
                            
                        }
                    }
                }
                .navigationTitle("GitHub")
            }
        case ApiState.loading:
            ProgressView()
        case .failed:
            EmptyView()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
