//
//  VehiclesListViewModelTests.swift
//  WunderDemoTests
//
//  Created by Karem Gohar on 26.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import XCTest
@testable import WunderDemo
import RxTest
import RxCocoa
import RxSwift

class VehiclesListViewModelTests: XCTestCase {
    
    var scheduler: TestScheduler?
    var service: VehicleMockService?
    var disposeBag: DisposeBag?
    var viewModel: VehiclesListViewModel?
    
    override func setUp() {
        super.setUp()
        self.scheduler = TestScheduler(initialClock: 0)
        self.disposeBag = DisposeBag()
        self.service = VehicleMockService()
    }
    
    func testFetchNetworkData() {
        
        guard let testObserver = scheduler?.createObserver([Vehicle]?.self),
            let response: (VehicleResponse?, Error?) = service?.getVehiclesList(),
            let vehicles = response.0?.vehicles else { return }
        
        let testInput: BehaviorRelay<[Vehicle]> = BehaviorRelay<[Vehicle]>(value: vehicles)
        
        let observableInput = testInput.asDriver().drive(testObserver)
        // TODO: Create a Mock TableView to act as an observer for the stream coming from the VM
        
        scheduler?.start()
        let expectedEvents = [next(5, response.0?.vehicles),
                              completed(6)]
        
        XCTAssertEqual(expectedEvents, testObserver.events)
    }
    
}
