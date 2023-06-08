//
//  CarrefourChallengeTests.swift
//  CarrefourChallengeTests
//
//  Created by Andre Lemos on 06/06/23.
//

import XCTest
@testable import CarrefourChallenge

final class CarrefourChallengeTests: XCTestCase {

    func testApiStateUserViewModel() {
        let viewModel = UserViewModel()
        XCTAssertTrue(viewModel.state == ApiState.loading )
        viewModel.state = ApiState.loaded
        XCTAssertFalse(viewModel.state == ApiState.loading)
        viewModel.state = ApiState.failed
        XCTAssertFalse(viewModel.state == ApiState.loading)
    }

    func testApiStateUserDetailsViewModel() {
        let viewModel = UserDetailsViewModel()
        XCTAssertTrue(viewModel.state == ApiState.loading )
        viewModel.state = ApiState.loaded
        XCTAssertFalse(viewModel.state == ApiState.loading)
        viewModel.state = ApiState.failed
        XCTAssertFalse(viewModel.state == ApiState.loading)
    }
    
    func testApiStateRepoViewModel() {
        let viewModel = RepoViewModel()
        XCTAssertTrue(viewModel.state == ApiState.loading )
        viewModel.state = ApiState.loaded
        XCTAssertFalse(viewModel.state == ApiState.loading)
        viewModel.state = ApiState.failed
        XCTAssertFalse(viewModel.state == ApiState.loading)
    }
    
    func testUserModel() {
        let viewModel = UserViewModel()
        XCTAssertTrue(viewModel.users.isEmpty)
        viewModel.users = [UserModel(
            login: "123",
            id: 1,
            nodeID: "123",
            avatarURL: "123",
            gravatarID: "123",
            url: "123",
            htmlURL: "123",
            followersURL: "123",
            followingURL: "123",
            gistsURL: "123",
            starredURL: "123",
            subscriptionsURL: "123",
            organizationsURL: "123",
            reposURL: "123",
            eventsURL: "123",
            receivedEventsURL: "123",
            type: "123",
            siteAdmin: false)]
        XCTAssertFalse(viewModel.users.isEmpty)
    }
    
    func testUserDetailModel() {
        let viewModel = UserDetailsViewModel()
        viewModel.usersDetails = UserDetailModel(login: "123")
        XCTAssertFalse(viewModel.usersDetails.login.isEmpty)
    }
    
    func testRepoModel() {
        let viewModel = RepoViewModel()
        XCTAssertTrue(viewModel.repos.isEmpty)
        viewModel.repos = [RepoModel(name: "Andre")]
        XCTAssertFalse(viewModel.repos.isEmpty)
    }
}
