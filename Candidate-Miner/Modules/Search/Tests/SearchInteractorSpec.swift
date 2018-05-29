//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import iFood

final class SearchInteractorSpec: QuickSpec {

    // MARK: - Mocks

    fileprivate class PresenterMock: SearchInteractorOutputProtocol {}
    fileprivate class APIDataManagerMock: SearchAPIDataManagerInputProtocol {}
    fileprivate class LocalDataManagerMock: SearchLocalDataManagerInputProtocol {}

    // MARK: - Tests

    override func spec() {
        describe("SearchInteractor") {

            // MARK: - Properties

            var sut: SearchInteractor!
            var presenterMock: PresenterMock!

            beforeEach {
                sut = SearchInteractor()
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
