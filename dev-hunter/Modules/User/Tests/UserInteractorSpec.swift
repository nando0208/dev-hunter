//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Candidate_Miner

final class UserInteractorSpec: QuickSpec {

    // MARK: - Mocks

    fileprivate class PresenterMock: UserInteractorOutputProtocol {}
    fileprivate class APIDataManagerMock: UserAPIDataManagerInputProtocol {}
    fileprivate class LocalDataManagerMock: UserLocalDataManagerInputProtocol {}

    // MARK: - Tests

    override func spec() {
        describe("UserInteractor") {

            // MARK: - Properties

            var sut: UserInteractor!
            var presenterMock: PresenterMock!

            beforeEach {
                sut = UserInteractor()
                sut.APIDataManager = APIDataManagerMock()
                sut.localDatamanager = LocalDataManagerMock()
                presenterMock = PresenterMock()
                sut.presenter = presenterMock
            }

            afterEach {
                sut = nil
                presenterMock = nil
            }
        }
    }
}
